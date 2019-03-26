context("Probability Mass Function")

test_that("[pmf] The summation of all probabilities must be 1.", {
  expect_equal(sum(dmoezipf(1:1000, alpha = 2, beta = 0.10)), 1, tolerance = 1*10^(-4))
  expect_equal(sum(dmoezipf(1:1000, alpha = 2.5, beta = 1.3)), 1, tolerance = 1*10^(-4))
  expect_equal(sum(dmoezipf(1:1000, alpha = 4, beta = 3)), 1, tolerance = 1*10^(-4))

  # En dependencia de los parametros se necesita un mayor numero de observaciones para asegurar
  # que el resultado converja correctamente.
  # expect_equal(sum(dmoezipf(1:100000, alpha = 1.25, beta = 5.3)), 1, tolerance = 1*10^(-4))
  # expect_equal(sum(dmoezipf(1:10000, alpha = 1.4, beta = 2.98)), 1, tolerance = 1*10^(-4))
})

test_that("[pmf] The probability lays on the interval (0, 1).", {
  pvalue <- dmoezipf(x = 9, alpha = 2, beta = 0.10)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
  
  pvalue <- dmoezipf(x = 9, alpha = 1.25, beta = 5.3)
  expect_lt(pvalue, 1)
  expect_gt(pvalue, 0)
})