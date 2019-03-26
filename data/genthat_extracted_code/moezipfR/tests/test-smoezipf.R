context("Probability Survival Function")

test_that("[sf] The survival probability lays on the interval (0, 1).", {
  pvalue <- smoezipf(x = 9, alpha = 2, beta = 0.10)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
  
  pvalue <- smoezipf(x = 9, alpha = 1.25, beta = 5.3)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
})