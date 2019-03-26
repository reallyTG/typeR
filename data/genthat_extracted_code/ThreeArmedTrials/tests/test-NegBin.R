context('Negative binomial distribution: test_RET')

test_that('p-value 0.5', {
  expect_equal(
    test_RET(xExp = 2:4,
             xRef = 1:3,
             xPla = 3:5,
             Delta = 0.5,
             distribution = "negbin")$p.value,
    0.5
  )
}
) # END test_that


set.seed(1234)
xExp <-rnbinom(60, mu=5, size=1)
xRef <-rnbinom(40, mu=4, size=1)
xPla <-rnbinom(40, mu=8, size=1)
Delta <- (8-5)/(8-4)

test_that('p-value', {
  expect_equal(
    round(test_RET(xExp = xExp,
                   xRef = xRef,
                   xPla = xPla,
                   Delta = Delta,
                   var_estimation = "RML",
                   distribution = "negbin")$p.value, 4),
    0.0527
  )
  expect_equal(
    round(test_RET(xExp = xExp,
                   xRef = xRef,
                   xPla = xPla,
                   Delta = Delta,
                   var_estimation = "ML",
                   distribution = "negbin")$p.value, 4),
    0.0484
  )
}
) # END test_that




context('Negative binomial distribution: opt_alloc_RET')

test_that('Errors', {
  expect_error(
    opt_alloc_RET(experiment = c(5, 1, 1),
                  reference = c(4, 1),
                  placebo = c(8, 1),
                  Delta = 0.8,
                  distribution = "negbin"),
    "Two parameters must be defined for optimal allocation calculations for negative binomial endpoints."
  )
  expect_error(
    opt_alloc_RET(experiment = c(5, -1),
                  reference = c(4, 1),
                  placebo = c(8, 1),
                  Delta = 0.8,
                  distribution = "negbin"),
    "Rates and shape parameters must be positive."
  )
  expect_error(
    opt_alloc_RET(experiment = c(1, 1, 1),
                  reference = c(1, 1),
                  placebo = c(3, 1),
                  Delta = -0.8,
                  distribution = "negbin"),
    "Margin must be positive."
  )
}
) # END test_that


test_that('Optimal allocation calculations', {
  expect_equal(
    round(opt_alloc_RET(experiment = c(2, 0.5),
                        reference = c(2, 0.5),
                        placebo = c(4, 0.5),
                        Delta = 0.8,
                        distribution = "negbin"), 4),
    c(0.4659, 0.3727, 0.1614)
  )
}
) # END test_that




context('Negative binomial distribution: power_RET')

test_that('Power unrestricted', {
  expect_equal(
    suppressWarnings(round(power_RET(experiment = c(2, 0.5),
                                     reference = c(2, 0.5),
                                     placebo = c(4, 0.5),
                                     Delta = 0.8,
                                     sig_level = 0.025,
                                     n = 923,
                                     allocation = c(2/5, 2/5, 1/5),
                                     var_estimation = "ML",
                                     distribution = "negbin")$power, 4)),
    0.8002
  )
  expect_equal(
    power_RET(experiment = c(2, 0.5),
              reference = c(2, 0.5),
              placebo = c(4, 0.5),
              Delta = 0.8,
              sig_level = 0.025,
              power = 0.8,
              allocation = c(2/5, 2/5, 1/5),
              var_estimation = "ML",
              distribution = "negbin")$n,
    923
  )
  expect_error(
    power_RET(experiment = c(2, 0.5, 1),
              reference = c(2, 0.5, 1),
              placebo = c(4, 0.5, 1),
              Delta = 0.8,
              sig_level = 0.025,
              power = 0.8,
              allocation = c(2/5, 2/5, 1/5),
              var_estimation = "ML",
              distribution = "negbin"),
    "Two parameters must be defined for power related calculations for negative binomial endpoints."
  )
}
) # END test_that


test_that('Power restricted', {
  expect_equal(
    suppressWarnings(round(power_RET(experiment = c(2, 0.5),
                                     reference = c(2, 0.5),
                                     placebo = c(4, 0.5),
                                     Delta = 0.8,
                                     sig_level = 0.025,
                                     n = 963,
                                     allocation = c(2/5, 2/5, 1/5),
                                     var_estimation = "RML",
                                     distribution = "negbin")$power, 4)),
    0.8003
  )
  expect_equal(
    power_RET(experiment = c(2, 0.5),
              reference = c(2, 0.5),
              placebo = c(4, 0.5),
              Delta = 0.8,
              sig_level = 0.025,
              power = 0.8,
              allocation = c(2/5, 2/5, 1/5),
              var_estimation = "RML",
              distribution = "negbin")$n,
    963
  )
}
) # END test_that

