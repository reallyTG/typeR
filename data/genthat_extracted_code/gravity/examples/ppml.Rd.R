library(gravity)


### Name: ppml
### Title: Poisson Pseudo Maximum Likelihood (PPML)
### Aliases: ppml

### ** Examples

# Example for CRAN checks:
# Executable in < 5 sec
library(dplyr)
data("gravity_no_zeros")

# Choose 5 countries for testing
countries_chosen <- c("AUS", "CHN", "GBR", "BRA", "CAN")
grav_small <- filter(gravity_no_zeros, iso_o %in% countries_chosen)

fit <- ppml(
  dependent_variable = "flow",
  distance = "distw",
  additional_regressors = c("rta", "iso_o", "iso_d"),
  robust = FALSE,
  data = grav_small
)




