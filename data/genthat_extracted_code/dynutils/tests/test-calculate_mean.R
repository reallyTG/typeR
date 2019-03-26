context("Means")

test_that(paste0("calculate_mean"), {
  testthat::expect_equal(calculate_arithmetic_mean(0.5, 0.6, 0.7), 0.6)
  testthat::expect_equal(calculate_harmonic_mean(0.5, 1, 1), 0.75)
  testthat::expect_equal(calculate_geometric_mean(0.001, 1, 1), 0.1)

  testthat::expect_equal(calculate_arithmetic_mean(0.1, 0.4, 0.4, weights = c(1, 2, 5)), 0.3625)
  testthat::expect_equal(calculate_harmonic_mean(0.5, 1, 1, weights = c(1, 2, 4)), 0.875)
  testthat::expect_equal(calculate_geometric_mean(0.001, 1, 1, weights = c(1, 2, 0)), 0.1)

  testthat::expect_true(length(calculate_arithmetic_mean(tibble::tibble(x = numeric(), y = numeric()), weights = c(x = 0, y = 1))) == 0)
  testthat::expect_true(length(calculate_harmonic_mean(tibble::tibble(x = numeric(), y = numeric()), weights = c(x = 0, y = 1))) == 0)
  testthat::expect_true(length(calculate_geometric_mean(tibble::tibble(x = numeric(), y = numeric()), weights = c(x = 0, y = 1))) == 0)

  testthat::expect_equal(calculate_mean(0.1, 0.4, 0.4, weights = c(1, 2, 5), method = "arithmetic"), 0.3625)
  testthat::expect_equal(calculate_mean(0.5, 1, 1, weights = c(1, 2, 4), method = "harmonic"), 0.875)
  testthat::expect_equal(calculate_mean(0.001, 1, 1, weights = c(1, 2, 0), method = "geometric"), 0.1)

  # testing variants of each function
  testthat::expect_equal(calculate_arithmetic_mean(c(1, 2, 3), c(4, 5, 6), weights = c(2, 1)), c(2, 3, 4))
  testthat::expect_equal(calculate_arithmetic_mean(cbind(c(1, 2, 3), c(4, 5, 6)), weights = c(2, 1)), c(2, 3, 4))
  testthat::expect_equal(calculate_arithmetic_mean(list(c(1, 2, 3), c(4, 5, 6)), weights = c(2, 1)), c(2, 3, 4))
  testthat::expect_equal(calculate_arithmetic_mean(c(1, 4), weights = c(2, 1)), 2)

  exp <- 3 / c(1 / .2 + 1 / .2 + 1 / .3, 1 / .2 + 1 / .2 + 1 / .4, 1 / .3 + 1 / .3 + 1 / .6)
  testthat::expect_equal(calculate_harmonic_mean(c(0.2, 0.2, 0.3), c(0.3, 0.4, 0.6), weights = c(2, 1)), exp)
  testthat::expect_equal(calculate_harmonic_mean(cbind(c(0.2, 0.2, 0.3), c(0.3, 0.4, 0.6)), weights = c(2, 1)), exp)
  testthat::expect_equal(calculate_harmonic_mean(list(c(0.2, 0.2, 0.3), c(0.3, 0.4, 0.6)), weights = c(2, 1)), exp)
  testthat::expect_equal(calculate_harmonic_mean(c(0.2, 0.3), weights = c(2, 1)), exp[[1]])

  exp <- c(.2 * .2 * .3, .2 * .2 * .4, .3 * .3 * .6)^(1 / 3)
  testthat::expect_equal(calculate_geometric_mean(c(0.2, 0.2, 0.3), c(0.3, 0.4, 0.6), weights = c(2, 1)), exp)
  testthat::expect_equal(calculate_geometric_mean(cbind(c(0.2, 0.2, 0.3), c(0.3, 0.4, 0.6)), weights = c(2, 1)), exp)
  testthat::expect_equal(calculate_geometric_mean(list(c(0.2, 0.2, 0.3), c(0.3, 0.4, 0.6)), weights = c(2, 1)), exp)
  testthat::expect_equal(calculate_geometric_mean(c(0.2, 0.3), weights = c(2, 1)), exp[[1]])

  testthat::expect_error(calculate_arithmetic_mean("I am a banana"), regexp = "Invalid input")
})
