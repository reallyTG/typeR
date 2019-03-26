context('Poisson distribution: test_RET')

test_that('p-value and test statistic', {

  out_ml <- test_RET(xExp = c(288, rep(0, times = 17)),
                     xRef = c(295, rep(0, times = 17)),
                     xPla = c(338, rep(0, times = 17)),
                     Delta = 0.5,
                     distribution = "poisson")
  out_ml2 <- test_RET(xExp = c(288, rep(0, times = 17)),
                      xRef = c(295, rep(0, times = 17)),
                      xPla = c(338, rep(0, times = 17)),
                      Delta = 0.5,
                      distribution = "poisson",
                      var_estimation = "ML")
  out_rml <- test_RET(xExp = c(288, rep(0, times = 17)),
                     xRef = c(295, rep(0, times = 17)),
                     xPla = c(338, rep(0, times = 17)),
                     Delta = 0.5,
                     distribution = "poisson",
                     var_estimation = "RML")

  expect_equal(out_ml$p.value, out_ml2$p.value)
  expect_equal(round(out_ml$p.value, 4), 0.0886)
  expect_equal(round(out_ml$statistic, 4)[[1]], -1.3491)
  expect_equal(round(out_rml$p.value, 4), 0.0921)
  expect_equal(round(out_rml$statistic, 4)[[1]], -1.3281)
}
) # END test_that



context('Poisson distribution: opt_alloc_RET')

test_that('Errors', {
  expect_error(
    opt_alloc_RET(experiment = 0,
                  reference = 1,
                  placebo = 3,
                  Delta = 0.8,
                  distribution = "poisson"),
    "Rates must be positive."
  )
  expect_error(
    opt_alloc_RET(experiment = c(1, 1),
                  reference = c(1, 1),
                  placebo = c(3, 1),
                  Delta = 0.8,
                  distribution = "poisson"),
    "Only one parameter must be defined for optimal allocation calculations for poisson endpoints."
  )
}
) # END test_that

test_that('Calculations', {
  expect_equal(
    round(opt_alloc_RET(experiment = 10,
                        reference = 10,
                        placebo = 20,
                        Delta = 0.7,
                        distribution = "poisson"), 3),
    c(0.471, 0.33, 0.2)
  )
}
) # END test_that
