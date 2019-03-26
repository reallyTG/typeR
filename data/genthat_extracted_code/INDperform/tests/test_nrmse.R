context("test nrmse")

# General test
obs <- c(10, 14, 20)
pred <- c(9, 12, 23)
test_nrmse <- nrmse(obs, pred)

test_that("test output format", {
  expect_is(test_nrmse, "numeric")
  expect_true(length(test_nrmse) == 1)
  expect_true(test_nrmse >= 0)
})

# Test input validation routine
test_that("test error messages", {
  expect_error(nrmse(pred, obs, method = "stdev"),
    "You specified the wrong method!")
  expect_error(nrmse(pred, obs, transformation = "LOG"),
    "You specified the wrong transformation!")
  expect_error(nrmse(pred, obs, transformation = "other"),
    "You need to specify trans_function ")
  expect_error(nrmse(pred, obs[-1]), "The observation and prediction vectors ")
})


# Test method
obs <- c(10, 14, 20)
pred <- c(9, 12, 23)

squared_sums <- sum((obs - pred)^2)
mse <- squared_sums/length(obs)
rmse <- sqrt(mse)
nrmse_sd <- abs(rmse/sd(obs))
nrmse_mean <- abs(rmse/mean(obs))
nrmse_maxmin <- abs(rmse/(max(obs) - min(obs)))
nrmse_iq <- abs(rmse/(quantile(obs, 0.75) - quantile(obs,
  0.25)))
names(nrmse_iq) <- NULL

test_that("test method", {
  expect_equal(nrmse_sd, nrmse(pred, obs))
  expect_equal(nrmse_sd, nrmse(pred, obs, method = "sd"))
  expect_equal(nrmse_mean, nrmse(pred, obs, method = "mean"))
  expect_equal(nrmse_maxmin, nrmse(pred, obs, method = "maxmin"))
  expect_equal(nrmse_iq, nrmse(pred, obs, method = "iq"))
})


# Test back-transformation
nrmse_func <- function(pred, obs) {
  squared_sums <- sum((obs - pred)^2)
  mse <- squared_sums/length(obs)
  rmse <- sqrt(mse)
  nrmse <- abs(rmse/sd(obs))
  return(nrmse)
}

obs <- c(10, 14, 20)
pred <- c(9, 12, 23)

sqrt_rnmse <- nrmse_func(pred = pred^2, obs = obs^2)
frt_rnmse <- nrmse_func(pred = pred^4, obs = obs^4)
log_nrmse <- nrmse_func(pred = exp(pred), obs = exp(obs))
log10_rnmse <- nrmse_func(pred = 10^pred, obs = 10^obs)
log2_nrmse <- nrmse_func(pred = 2^pred, obs = 2^obs)
log1p_nrmse <- nrmse_func(pred = expm1(pred), obs = expm1(obs))

obs_prop <- obs/100
pred_prop <- pred/100
arcsine_nrmse <- nrmse_func(pred = sin(pred_prop)^2,
  obs = sin(obs_prop)^2)

test_that("test transformation", {
  expect_equal(sqrt_rnmse, nrmse(pred, obs, transformation = "sqrt"))
  expect_equal(frt_rnmse, nrmse(pred, obs, transformation = "4thrt"))
  expect_equal(log_nrmse, nrmse(pred, obs, transformation = "log"))
  expect_equal(log10_rnmse, nrmse(pred, obs, transformation = "log10"))
  expect_equal(log2_nrmse, nrmse(pred, obs, transformation = "log2"))
  expect_equal(log1p_nrmse, nrmse(pred, obs, transformation = "log1p"))
  expect_equal(arcsine_nrmse, nrmse(pred_prop, obs_prop,
    transformation = "arcsine"))
})


# Test own trans_function for back-transformation
obs <- c(10, 14, 20)
pred <- c(9, 12, 23)

# log(x + 0.001)
obs1 <- log(obs + 0.001)
pred1 <- log(pred + 0.001)
nrmse_comp1 <- nrmse_func(pred = exp(pred1) - 0.001,
  obs = exp(obs1) - 0.001)

# different power function x^(1/3)
obs2 <- obs^(1/3)
pred2 <- pred^(1/3)
nrmse_comp2 <- nrmse_func(pred = pred2^3, obs = obs2^3)

test_that("test trans_function", {
  expect_equal(nrmse_comp1, nrmse(pred1, obs1, transformation = "other",
    trans_function = "exp(x)-0.001"))
  expect_equal(nrmse_comp2, nrmse(pred2, obs2, transformation = "other",
    trans_function = "x^3"))
})


# Test handling of NAs in pred and obs vectors
obs = c(NA, 1, 2, NA, 9)
pred1 <- c(2, NA, 3, NA, 7)
pred2 = c(2, NA, 3, NA, NA)
pred3 = rep(NA, 5)

test_that("test trans_function", {
  expect_true(nrmse(pred1, obs) > 0)
  expect_true(is.na(suppressMessages(nrmse(pred2,
    obs))))
  expect_message(nrmse(pred2, obs), "Not enough observations")
  expect_true(is.na(suppressMessages(nrmse(pred3,
    obs))))
  expect_message(nrmse(pred3, obs), "Not enough observations")
})
