context("test-gravity.R")

test_that("ET Tobit returns a valid output", {
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

  fit <- et_tobit(
    dependent_variable = "flow",
    distance = "distw",
    additional_regressors = c("rta", "lgdp_o", "lgdp_d"),
    data = grav_small
  )

  expect_is(fit, "censReg")
})
