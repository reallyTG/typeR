context("Model estimation")


test_that("estimateIntervals simple example", {

  data <- data.frame(
    intStart = 0:5,
    intEnd = 1:6,
    bone1 = c(100, 50, 20, 10, 5, 2),
    bone2 = c(100, 10, 5, 1, 1, 1),
    tooth1 = c(0, 100, 0, 0, 0, 0),
    tooth2 = c(0, 0, 100, 0, 0, 0)
  )
  y_mean <- c(-10, -7, -12, -9)
  y_sigma <- c(2, 1.5, 2.5, 2.5)
  options(mc.cores = 2)
  fit <- estimateIntervals(renewalRates = data,
                           timeVars = "intStart",
                           boneVars = c("bone1", "bone2", "tooth1", "tooth2"),
                           isoMean = y_mean,
                           isoSigma = y_sigma)
  
  
  expect_s4_class(fit, "TemporalIso")
  expect_type(fit@regressor, "double")
  expect_equal(class(fit@regressor), "matrix")
  expect_output(print(fit), "mu")
  expect_output(print(fit), "mean")
  expect_equal(fit@model_pars, c("mu", "alpha", "rho", "interval", "lp__"))
})

test_that("estimateIntervals stops", {
  
  dat <- data.frame(
    bone = c(100, 50, 20),
    time = 1:3
  )
  
  expect_error(
    estimateIntervals(
      renewalRates = dat,
      boneVars = c("bone"),
      timeVars = c("time"),
      isoMean = 5,
      isoSigma = -1
    ),
    "isoSigma > 0 is not TRUE",
    fixed = TRUE
  )
  
  dat <- data.frame(
    bone = c(120, 50, 20),
    time = 1:3
  )
  
  expect_error(
    estimateIntervals(
      renewalRates = dat,
      boneVars = c("bone"),
      timeVars = c("time"),
      isoMean = 5,
      isoSigma = 1
    ),
    "max(renewalRates[boneVars]) <= 100 is not TRUE",
    fixed = TRUE
  )
  
})
