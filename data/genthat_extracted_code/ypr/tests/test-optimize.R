context("optimize")

test_that("optimize", {
  expect_equal(ypr_optimize(ypr_population()), 0.1060144, tolerance = 1e-06)
  expect_equal(ypr_optimize(ypr_population(), biomass = TRUE), 0.0938727, tolerance = 1e-06)
  expect_identical(ypr_optimise, ypr_optimize)
})
