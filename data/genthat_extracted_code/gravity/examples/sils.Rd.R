library(gravity)


### Name: sils
### Title: Structural Iterated Least Squares (SILS)
### Aliases: sils

### ** Examples

# Example for CRAN checks:
# Executable in < 5 sec
library(dplyr)
data("gravity_no_zeros")

# Choose 5 countries for testing
countries_chosen <- c("AUS", "CHN", "GBR", "BRA", "CAN")
grav_small <- filter(gravity_no_zeros, iso_o %in% countries_chosen)

fit <- sils(
  dependent_variable = "flow",
  distance = "distw",
  additional_regressors = "rta",
  income_origin = "gdp_o",
  income_destination = "gdp_d",
  code_origin = "iso_o",
  code_destination = "iso_d",
  maxloop = 50,
  dec_places = 3,
  robust = FALSE,
  verbose = FALSE,
  data = grav_small
)




