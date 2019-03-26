context('Normal distribution: test_RET')

test_that('Warnings', {
  expect_warning(
    test_RET(xExp = 2:4,
             xRef = 1:3,
             xPla = 3:5,
             Delta = 0.5,
             distribution = "normal"),
    "Parameter 'var_equal' not specified. Heteroscedastic group variances are assumed."
  )
}
) # END test_that

test_that('p-value', {
  expect_equal(
    test_RET(xExp = 2:4,
             xRef = 1:3,
             xPla = 3:5,
             Delta = 0.5,
             distribution = "normal",
             var_equal = TRUE)$p.value,
    0.5
  )
}
) # END test_that



context('Normal distribution: opt_alloc_RET')

test_that('Errors', {
  expect_error(
    opt_alloc_RET(experiment = 1,
                  reference = 1,
                  placebo = 3,
                  Delta = 0.8,
                  distribution = "normal"),
    "Two parameters must be defined for optimal allocation calculations for normally distributed endpoints."
  )
  expect_error(
    opt_alloc_RET(experiment = c(1, 1),
                  reference = c(1, 1),
                  placebo = c(3, 0),
                  Delta = 0.8,
                  distribution = "normal"),
    "Variances must be positive."
  )
  expect_error(
    opt_alloc_RET(experiment = c(1, 1, 1),
                  reference = c(1, 1),
                  placebo = c(3, 1),
                  Delta = 0.8,
                  distribution = "normal"),
    "Two parameters must be defined for optimal allocation calculations for normally distributed endpoints."
  )
}
) # END test_that

test_that('Calculations', {
  expect_equal(
    opt_alloc_RET(experiment = c(1, 1),
                  reference = c(1, 1),
                  placebo = c(3, 1),
                  Delta = 0.8,
                  distribution = "normal"),
    c(1, 0.8, 0.2) / 2
  )
  expect_equal(
    opt_alloc_RET(experiment = c(1, 1),
                  reference = c(1, 2),
                  placebo = c(3, 1),
                  Delta = 0.8,
                  distribution = "normal"),
    c(1, 0.8*sqrt(2), 0.2) / sum(c(1, 0.8*sqrt(2), 0.2))
  )
}
) # END test_that
