test_that("[zpe] Checking preconditions", {
  expect_error(dzipfpe(1, "2.5", -1.5),
               "Incorrect alpha parameter. This parameter should be greater than one.")
  expect_error(pzipfpe(1, 0.5, -1.5),
               "Incorrect alpha parameter. This parameter should be greater than one.")
  expect_error(dzipfpe(1, 2.5, "-1.5"),
               "Incorrect beta parameter. You should provide a numeric value.")
  expect_error(dzipfpe("1", 2.5, -1.5),
               "The x value is not included into the support of the distribution.")
  expect_error(pzipfpe(0, 2.5, -1.5),
               "The x value is not included into the support of the distribution.")
  expect_error(dzipfpe(1.6, 2.5, -1.5),
               "The x value is not included into the support of the distribution.")
})

test_that("[zpe - pmf] The summation of all probabilities must be 1.", {
  expect_equal(1,sum(dzipfpe(1:1000, alpha = 2.5, beta = 1.3)), tolerance = 1*10^(-3))
  expect_equal(1,sum(dzipfpe(1:1000, alpha = 2.5, beta = -3)), tolerance = 1*10^(-3))
})

test_that("[zpe - pmf] The probability lays on the interval (0, 1).", {
  pvalue <- dzipfpe(x = 9, alpha = 2, beta = 1.6)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)

  pvalue <- dzipfpe(x = 9, alpha = 1.25, beta = -5.3)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
})

test_that("[zpe - cdf] The summation of all probabilities must be 1.", {
  expect_equal(1,pzipfpe(1000, alpha = 2.5, beta = 1.3), tolerance = 1*10^(-3))
  expect_equal(1,pzipfpe(1000, alpha = 2.5, beta = -3), tolerance = 1*10^(-3))
})

test_that("[moezipf- cdf] The cumulative probabilities have to be in the interval (0, 1).", {
  pvalue <- pzipfpe(q = 9, alpha = 2, beta = 1.6)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)

  pvalue <- pzipfpe(q = 9, alpha = 1.25, beta = -5.3)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
})
