# test-plotMCMC.R
context("checks for plotMCMC")

k6_data <- exampleStructure("barplot")
k10_runs <- exampleStructure("mcmc_diagnostics")

test_that("sanity checks for plotMCMC", {
  # expect error if no logging data
  expect_error(plotMCMC(k6_data))
  expect_silent(plotMCMC(k10_runs[[1]], plot = FALSE))
  expect_silent(plotMCMC(k10_runs[2:4], plot = FALSE))
})
