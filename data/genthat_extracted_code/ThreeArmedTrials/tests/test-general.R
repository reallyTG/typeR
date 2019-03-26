context('test_RET - General')

test_that('Error handling',
          {
            expect_error(
              test_RET(xExp = rnorm(5),
                       xRef = rnorm(5),
                       xPla = rnorm(5),
                       Delta = 0),
              "'Delta' must be numeric and positive."
            )
            expect_error(
              test_RET(xExp = rnorm(5),
                       xRef = rnorm(5),
                       xPla = rnorm(5)),
              "'Delta' must be numeric and positive."
            )
            expect_warning(
              test_RET(xExp = c(0, 0),
                       xRef = c(0, 0),
                       xPla = c(0, 0),
                       Delta = 0.8),
              "Effect and variance are zero. No p-value will be calculated."
            )
            expect_error(
              test_RET(xExp = 0,
                       xRef = c(0, 0),
                       xPla = c(0, 0),
                       Delta = 0.8,
                       distribution = "normal"),
              "Each group must have at least two observations."
            )
          }
) # END test_that

test_that('p-value',
          {           expect_equal(
            suppressWarnings(test_RET(xExp = 2:4,
                                      xRef = 1:3,
                                      xPla = 3:5,
                                      Delta = 0.5)$p.value),
            0.5
          )
          }
) # END test_that



context('opt_alloc_RET - General')

test_that('Errors', {
  expect_error(
    opt_alloc_RET(experiment = 1,
                  reference = 1,
                  placebo = 1,
                  Delta = 0.8),
    "argument \"distribution\" is missing, with no default"
  )
  expect_error(
    opt_alloc_RET(experiment = 1,
                  reference = 1,
                  placebo = 1,
                  Delta = 0,
                  distribution = "poisson"),
    "Margin must be positive."
  )
  expect_error(
    opt_alloc_RET(reference = 1,
                  placebo = 1,
                  Delta = 0.8,
                  distribution = "poisson"),
    "None of the parameter vectors must be missing."
  )
}
) # END test_that



