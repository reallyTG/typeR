context('Exponential distribution: test_RET')

test_that('p-value and test statistic', {

  # Start Example
  # Source: Mielke (2010). Maximum Likelihood Theory for Retention of Effect Non-inferiority Trials. PhD-Thesis.
  n.t <- 200
  n.r <- 150
  n.p <- 100
  set.seed(666)
  t.t <- rexp(n.t,1/10)
  t.r <- rexp(n.r,1/10)
  t.p <- rexp(n.p,1/15)
  u.t <- rexp(n.t,1/10)
  u.r <- rexp(n.r,1/10)
  u.p <- rexp(n.p,1/15)
  x.t <- cbind(apply(cbind(t.t,u.t),1,min),as.numeric(t.t<=u.t))
  x.r <- cbind(apply(cbind(t.r,u.r),1,min),as.numeric(t.r<=u.r))
  x.p <- cbind(apply(cbind(t.p,u.p),1,min),as.numeric(t.p<=u.p))
  # End Example

  out_exp <- test_RET(xExp = x.t,
                      xRef = x.r,
                      xPla = x.p,
                      Delta = 0.7,
                      distribution = "exponential")

  expect_equal(round(out_exp$p.value, 4), 0.0415)
  expect_equal(round(out_exp$statistic, 4)[[1]], -1.7341)
}
) # END test_that



context('Exponential distribution: opt_alloc_RET')

test_that('Errors', {
  expect_error(
    opt_alloc_RET(experiment = c(0, 0.3),
                  reference = c(1, 0.3),
                  placebo = c(3, 0.3),
                  Delta = 0.8,
                  distribution = "exponential"),
    "Rates and uncensore-probabilities must be positive."
  )
  expect_error(
    opt_alloc_RET(experiment = c(1),
                  reference = c(1, 1),
                  placebo = c(3, 1),
                  Delta = 0.8,
                  distribution = "exponential"),
    "Two parameters must be defined for optimal allocation calculations for censored exponential endpoints."
  )
}
) # END test_that

test_that('Calculations', {
  expect_equal(
    opt_alloc_RET(experiment = c(2, 0.8),
                  reference = c(2, 0.8),
                  placebo = c(3, 0.9),
                  Delta = 0.7,
                  distribution = "exponential"),
    c(1, 0.7*sqrt(0.8/0.8), 0.3*sqrt(0.8/0.9)) / sum(c(1, 0.7*sqrt(0.8/0.8), 0.3*sqrt(0.8/0.9)))
  )
  expect_equal(
    opt_alloc_RET(experiment = c(2, 0.4),
                  reference = c(2, 0.8),
                  placebo = c(3, 0.9),
                  Delta = 0.7,
                  distribution = "exponential"),
    c(1, 0.7*sqrt(0.4/0.8), 0.3*sqrt(0.4/0.9)) / sum(c(1, 0.7*sqrt(0.4/0.8), 0.3*sqrt(0.4/0.9)))
  )
}
) # END test_that
