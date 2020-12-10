terraform {
  required_providers {
    mcbroken = {
      source  = "circa10a/mcbroken"
    }
  }
}

provider "mcbroken" {}

// Data source to get all available cities/national average of broken ice cream machines
data "mcbroken_cities" "all" {}

// Data source to get current outage percentage of a specific city
data "mcbroken_city" "Dallas" {
    city = "Dallas"
}

// If specified city isn't found, returns -1
data "mcbroken_city" "not_found" {
    city = "not_found"
}

// Get national average of broken ice cream machines
output "global_broken_average" {
    value = data.mcbroken_cities.all.broken
}

// Get list of all cities and their outage percentage
output "all_available_cities" {
    value = data.mcbroken_cities.all.cities
}

// Get outage percentage of a specific city
output "user_specified_city" {
    value = data.mcbroken_city.Dallas.broken
}

// When user specified city isn't found, return -1
output "user_specified_city_not_found" {
    value = data.mcbroken_city.not_found.broken
}
