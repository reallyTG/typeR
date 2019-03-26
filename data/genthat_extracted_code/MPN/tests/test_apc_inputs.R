context("apc function - argument sanity checks")
#Test if the arguments for function apc() make sense

#Setup some scenarios
my_count       <- c(12, 8, 15, 40, 58)
my_amount_scor <- c(1, 1, 1, 10, 10)
my_amount_tntc <- c(10, 100, 100, 100)
my_tntc_limit  <- 100

testthat::test_that("do warnings/errors get correctly printed?", {
  expect_error(apc(my_count, my_amount_scor[-1], my_amount_tntc, my_tntc_limit),
               "'count' &  'amount_scor' must be the same length",
               fixed = TRUE)
  expect_error(apc(c(), c(), my_amount_tntc, my_tntc_limit),
               "there must be at least one scorable plate",
               fixed = TRUE)
  expect_error(apc(c(12, 8, 15, NA, 58), my_amount_scor, my_amount_tntc,
                   my_tntc_limit),
               "missing values not allowed for 'count' or 'amount_scor'",
               fixed = TRUE)
  expect_error(apc(my_count, c(NA, 1, 1, 10, 10), my_amount_tntc,
                   my_tntc_limit),
               "missing values not allowed for 'count' or 'amount_scor'",
               fixed = TRUE)
  expect_error(apc(c(-12, 8, 15, 40, 58), my_amount_scor, my_amount_tntc,
                   my_tntc_limit),
               "'count' must contain non-negative whole numbers",
               fixed = TRUE)
  expect_error(apc(c(12.1, 8, 15, 40, 58), my_amount_scor, my_amount_tntc,
                   my_tntc_limit),
               "'count' must contain non-negative whole numbers",
               fixed = TRUE)
  expect_error(apc(my_count, c(1, 1, 0, 10, 10), my_amount_tntc,
                   my_tntc_limit),
               "'amount_scor' must contain positive values",
               fixed = TRUE)
  expect_error(apc(my_count, my_amount_scor, my_amount_tntc, my_tntc_limit,
                   conf_level = c(.95, .99)),
               "'conf_level' must have length of 1",
               fixed = TRUE)
  expect_error(apc(my_count, my_amount_scor, my_amount_tntc, my_tntc_limit,
                   conf_level = 0),
               "'conf_level' must be between 0 & 1",
               fixed = TRUE)
  expect_error(apc(my_count, my_amount_scor, my_amount_tntc, my_tntc_limit,
                   conf_level = 95),
               "'conf_level' must be between 0 & 1",
               fixed = TRUE)
  expect_error(apc(c(0, 0, 0, 0, 0), my_amount_scor, my_amount_tntc,
                   my_tntc_limit),
               "if all scorable counts are zero, there should not be any TNTC plates",
               fixed = TRUE)
})
