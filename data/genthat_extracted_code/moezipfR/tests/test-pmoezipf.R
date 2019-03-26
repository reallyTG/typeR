context("Cumulative Probability Function")

test_that("[pcf] The cumulative probabilities have to be in the interval (0, 1).", {
  pvalue <- pmoezipf(x = 9, alpha = 2, beta = 0.10)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
  
  pvalue <- pmoezipf(x = 9, alpha = 1.25, beta = 5.3)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
})