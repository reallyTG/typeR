context("mpn function - argument sanity checks")
#Test if the arguments for function mpn() make sense

#Setup some scenarios
tubes  <- c(3, 3, 3)
amount <- c(1, .1, .01)

testthat::test_that("do warnings/errors get correctly printed?", {
  expect_error(mpn(positive = 1, tubes = tubes, amount = amount),
               "'positive', 'tubes', & 'amount' must be the same length",
               fixed = TRUE)
  expect_error(mpn(positive = c(NA, 1, 1), tubes = tubes, amount = amount),
               "missing values are not allowed",
               fixed = TRUE)
  expect_error(mpn(positive = c("1", 1, 1), tubes = tubes, amount = amount),
               "'positive', 'tubes', 'amount', & 'conf_level' must be numeric",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = c(-1, 1, 1), amount = amount),
               "'tubes' must contain positive whole numbers",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = c(1, 1.1, 1), amount = amount),
               "'tubes' must contain positive whole numbers",
               fixed = TRUE)
  expect_error(mpn(positive = c(-1, 1, 1), tubes = tubes, amount = amount),
               "'positive' must contain non-negative whole numbers",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1.9, 1), tubes = tubes, amount = amount),
               "'positive' must contain non-negative whole numbers",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = tubes, amount = c(10, 1, 0)),
               "'amount' must contain positive values",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = tubes, amount = c(10, .01, .1)),
               "'amount' must be in descending order",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = tubes, amount = amount,
                   conf_level = c(.95, .99)),
               "'conf_level' must have length of 1",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = tubes, amount = amount, conf_level = 0),
               "'conf_level' must be between 0 & 1",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = tubes, amount = amount, conf_level = 1),
               "'conf_level' must be between 0 & 1",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 1, 1), tubes = tubes, amount = amount, conf_level = 95),
               "'conf_level' must be between 0 & 1",
               fixed = TRUE)
  expect_error(mpn(positive = c(1, 4, 1), tubes = tubes, amount = amount),
               "more positive tubes than possible",
               fixed = TRUE)
})
