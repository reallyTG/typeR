context("sensitize")

sample_df <- data.frame(
  id = 1,
  treat = c(0, 1),
  p_trt = c(.5, .5, .1, .1, .9, .9),
  resp_ctl = c(.2, .2),
  resp_trt = c(.3, .2)
)

test_that("sensitize() returns correct values for zero-effect params", {
  # Zero prevalence of u = 1
  generated <- sensitize(sample_df, q = 0, dp = 5, d0 = 5, d1 = 5)
  expect_equal(generated$resp_ctl, sample_df$resp_ctl)
  expect_equal(generated$resp_trt, sample_df$resp_trt)

  # Zero treatment effect
  generated <- sensitize(sample_df, q = .5, dp = 0, d0 = 5, d1 = 5)
  expect_equal(generated$resp_ctl, sample_df$resp_ctl)
  expect_equal(generated$resp_trt, sample_df$resp_trt)

  # Zero effect on outcome given control
  generated <- sensitize(sample_df, q = .5, dp = 5, d0 = 0, d1 = 5)
  expect_equal(generated$resp_ctl, sample_df$resp_ctl)

  # Zero effect on outcome given treatment
  generated <- sensitize(sample_df, q = .5, dp = 5, d0 = 5, d1 = 0)
  expect_equal(generated$resp_trt, sample_df$resp_trt)
})

test_that("sensitize() returns non-negative estimates for range of q", {
  qs <- seq(0, 1, 0.01)

  # Positive effects of u
  for (q in qs) {
    generated <- sensitize(sample_df, q = q, dp = 5, d0 = 5, d1 = 5)
    expect_gte(min(generated$resp_ctl), 0)
    expect_gte(min(generated$resp_trt), 0)
  }

  # Negative effects of u
  for (q in qs) {
    generated <- sensitize(sample_df, q = q, dp = -5, d0 = -5, d1 = -5)
    expect_gte(min(generated$resp_ctl), 0)
    expect_gte(min(generated$resp_trt), 0)
  }
})

test_that("sensitize() recovers ground truth, given true parameters", {
  gamma <- 1
  beta_trt <- 1.2
  beta_ctl <- 1.1

  q <- 0.32
  alpha <- 1.5
  delta <- 2

  ptrt_u0 <- inv_logit(gamma)
  ptrt_u1 <- inv_logit(gamma + alpha)

  pu0_ctl <- (1-ptrt_u0)*(1-q) / ((1-ptrt_u0)*(1-q) + (1-ptrt_u1)*q)
  pu0_trt <- ptrt_u0*(1-q) / (ptrt_u0*(1-q) + ptrt_u1*q)

  d <- data.frame(
    treat = c(0, 1),
    p_trt = ptrt_u0*(1-q) + ptrt_u1*q,
    resp_ctl = pu0_ctl*inv_logit(beta_ctl) +
      (1-pu0_ctl)*inv_logit(beta_ctl + delta),
    resp_trt = pu0_trt*inv_logit(beta_trt) +
      (1-pu0_trt)*inv_logit(beta_trt + delta)
  )

  g <- sensitize(d, debug = TRUE, q = q, dp = alpha, d0 = delta, d1 = delta)

  expect_equal(g$gamma__, rep(gamma, 2))
  expect_equal(g$beta_ctl__, rep(beta_ctl, 2))
  expect_equal(g$beta_trt__, rep(beta_trt, 2))
  expect_equal(g$ptrt_u0__, rep(ptrt_u0, 2))
  expect_equal(g$ptrt_u1__, rep(ptrt_u1, 2))
  expect_equal(g$pu0_ctl__, rep(pu0_ctl, 2))
  expect_equal(g$pu0_trt__, rep(pu0_trt, 2))
})
