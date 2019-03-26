library(gravity)


### Name: ek_tobit
### Title: Eaton and Kortum (2001) Tobit model (EK Tobit)
### Aliases: ek_tobit

### ** Examples

# Example for CRAN checks:
# Executable in < 5 sec
library(dplyr)
data("gravity_no_zeros")

# Choose 5 countries for testing
countries_chosen <- c("AUS", "CHN", "GBR", "BRA", "CAN")
grav_small <- filter(gravity_no_zeros, iso_o %in% countries_chosen)

grav_small <- grav_small %>%
  mutate(
    flow = ifelse(flow < 5, 0, flow), # cutoff for testing purposes
    lgdp_o = log(gdp_o),
   lgdp_d = log(gdp_d)
  )

fit <- ek_tobit(
  dependent_variable = "flow",
  distance = "distw",
  additional_regressors = c("distw", "rta", "lgdp_o", "lgdp_d"),
  code_destination = "iso_d",
  robust = FALSE,
  data = grav_small
)




