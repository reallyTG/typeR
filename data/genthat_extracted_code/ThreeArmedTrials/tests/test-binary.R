context('Binary: test_RET')

test_that('Error', {
  expect_error(
    test_RET(xExp = 2:4,
             xRef = 1:3,
             xPla = 3:5,
             Delta = 0.5,
             distribution = "binary")$p.value,
    "Binary data must be either 0 or 1."
  )
}
) # END test_that


test_that('p-value', {
  expect_equal(
    round(test_RET(xExp = remission$experimental,
                   xRef = remission$reference,
                   xPla = remission$placebo,
                   Delta = 0.8,
                   var_estimation = "RML",
                   distribution = "binary",
                   h = function(x){-log(x/(1-x))},
                   h_inv = function(x){exp(-x)/(1+exp(-x))})$p.value, 4),
    0.0171
  )
  expect_equal(
    round(test_RET(xExp = remission$experimental,
                   xRef = remission$reference,
                   xPla = remission$placebo,
                   Delta = 0.8,
                   var_estimation = "ML",
                   distribution = "binary",
                   h = function(x){-log(x/(1-x))},
                   h_inv = function(x){exp(-x)/(1+exp(-x))})$p.value, 4),
    0.0173
  )
  expect_equal(
    round(test_RET(xExp = remission$experimental,
                   xRef = remission$reference,
                   xPla = remission$placebo,
                   Delta = 0.8,
                   var_estimation = "RML",
                   distribution = "binary",
                   h = function(x){-x},
                   h_inv = function(x){-x})$p.value, 4),
    0.0177
  )
  expect_equal(
    round(test_RET(xExp = remission$experimental,
                   xRef = remission$reference,
                   xPla = remission$placebo,
                   Delta = 0.8,
                   var_estimation = "ML",
                   distribution = "binary",
                   h = function(x){-x},
                   h_inv = function(x){-x})$p.value, 4),
    0.0175
  )
}
) # END test_that




context('Binary: opt_alloc_RET')

test_that('Errors', {
  expect_error(
    opt_alloc_RET(experiment = c(0.3, 1),
                  reference = 0.3,
                  placebo = 0.1,
                  Delta = 0.8,
                  distribution = "binary"),
    "Parameters must have length one for optimal allocation calculations for binary endpoints."
  )
  expect_error(
    opt_alloc_RET(experiment = 0,
                  reference = 0.3,
                  placebo = 0.1,
                  Delta = 0.8,
                  distribution = "binary"),
    "Variances must be positive."
  )
  expect_error(
    opt_alloc_RET(experiment = 0.3,
                  reference = 0.4,
                  placebo = 0.8,
                  Delta = -0.8,
                  distribution = "binary"),
    "Margin must be positive."
  )
}
) # END test_that


test_that('Optimal allocation calculations', {
  expect_equal(
    round(opt_alloc_RET(experiment = 0.3,
                        reference = 0.3,
                        placebo = 0.1,
                        Delta = 0.7,
                        distribution = "binary"), 3),
    c(0.527, 0.369, 0.104)
  )
  expect_equal(
    round(opt_alloc_RET(experiment = 0.9,
                        reference = 0.9,
                        placebo = 0.8,
                        Delta = 0.7,
                        distribution = "binary"), 3),
    c(0.476, 0.333, 0.190)
  )
}
) # END test_that




context('Binary: power_RET')

test_that('Power calculations', {
  expect_equal(
    suppressWarnings(round(power_RET(experiment = 0.9,
                                     reference = 0.9,
                                     placebo = 0.4,
                                     Delta = 0.7,
                                     sig_level = 0.05,
                                     n = 117,
                                     allocation = c(2/5, 2/5, 1/5),
                                     h = function(x){-x},
                                     h_inv = function(x){-x},
                                     var_estimation = "RML",
                                     distribution = "binary")$power, 4)),
    0.7026
  )
  expect_equal(
    suppressWarnings(round(power_RET(experiment = 0.7,
                                     reference = 0.7,
                                     placebo = 0.2,
                                     Delta = 0.7,
                                     sig_level = 0.05,
                                     n = 179,
                                     allocation = c(2/5, 2/5, 1/5),
                                     h = function(x){-x},
                                     h_inv = function(x){-x},
                                     var_estimation = "ML",
                                     distribution = "binary")$power, 4)),
    0.7028
  )
  expect_equal(
    power_RET(experiment = 0.9,
              reference = 0.9,
              placebo = 0.6,
              Delta = 0.7,
              sig_level = 0.05,
              power = 0.7,
              allocation = c(2/5, 2/5, 1/5),
              h = function(x){-x},
              h_inv = function(x){-x},
              var_estimation = "RML",
              distribution = "binary")$n,
    292
  )
  expect_equal(
    power_RET(experiment = 0.5,
              reference = 0.5,
              placebo = 0.1,
              Delta = 0.7,
              sig_level = 0.05,
              power = 0.7,
              allocation = c(2/5, 2/5, 1/5),
              h = function(x){-x},
              h_inv = function(x){-x},
              var_estimation = "ML",
              distribution = "binary")$n,
    318
  )
}
) # END test_that


