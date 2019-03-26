context("test-gravity.R")

test_that("GPML returns a valid output", {
  # Example for CRAN checks:
  # Executable in < 5 sec
  library(dplyr)
  data("gravity_no_zeros")

  # Choose 5 countries for testing
  countries_chosen <- c("AUS", "CHN", "GBR", "BRA", "CAN")
  grav_small <- filter(gravity_no_zeros, iso_o %in% countries_chosen)

  grav_small <- grav_small %>%
    mutate(
      lgdp_o = log(gdp_o),
      lgdp_d = log(gdp_d)
    )

  fit <- gpml(
    dependent_variable = "flow",
    distance = "distw",
    additional_regressors = c("rta", "iso_o", "iso_d"),
    robust = FALSE,
    data = grav_small
  )

  expect_is(fit, "glm")
})
