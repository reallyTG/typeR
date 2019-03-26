## data

data(faithful)
X <- faithful
x <- faithful$eruptions

## sample size

N <- 2
n <- 10

## tests ----------------------------------------------

context("argument test: n")

test_that(desc = "univariate distribution", code = {

  expect_silent(res <- simulate_kde(x = x, n = n))
  expect_is(res, "list")
  expect_length(object = res$random.values, n = n)
  expect_error(simulate_kde(x = x, n = 10.5))
  expect_error(simulate_kde(x = x, n = 0))
  expect_error(simulate_kde(x = x, n = -1))

})

test_that(desc = "multivariate distribution", code = {

  expect_silent(res <- simulate_kde(x = X, n = N))
  expect_is(res, "list")
  expect_is(res$random.values, "matrix")
  expect_equal(object = dim(res$random.values), expected = c(N, dim(X)[2]))
  expect_error(simulate_kde(x = X, n = 2.5))
  expect_error(simulate_kde(x = X, n = 0))
  expect_error(simulate_kde(x = X, n = -1))

})

## ----------------------------------------------------

context("argument test: distr")

test_that(desc = "univariate distribution", code = {

  for (distr in c("norm", "exp", "unif", "gamma", "cauchy", "lnorm", "weibull")) {
    expect_silent(res <- simulate_kde(x = x, n = n, distr = distr))
    expect_is(res, "list")
    expect_length(object = res$random.values, n = n)
  }
  expect_error(simulate_kde(x = x, n = n, distr = "t"))

})

test_that(desc = "multivariate distribution", code = {

  expect_silent(res <- simulate_kde(x = X, n = N, distr = "norm"))
  expect_is(res, "list")
  expect_is(res$random.values, "matrix")
  expect_equal(object = dim(res$random.values), expected = c(N, dim(X)[2]))
  expect_error(simulate_kde(x = X, distr = "t", n = N))

})

## ----------------------------------------------------

context("argument test: const.only")

test_that(desc = "univariate distribution", code = {

  for (distr in c("norm", "exp", "unif", "gamma", "cauchy", "lnorm", "weibull")) {
    expect_is(object = simulate_kde(x = x, distr = distr, const.only = TRUE), class = "numeric")
  }
  expect_is(object = simulate_kde(x = x, const.only = "TRUE"), class = "numeric")
  expect_is(object = simulate_kde(x = x, const.only = 1), class = "numeric")
  expect_silent(res <- simulate_kde(x = x, const.only = 0))
  expect_is(res, "list")
  expect_error(object = simulate_kde(x = x, const.only = "YES"))

})

test_that(desc = "multivariate distribution", code = {

  expect_is(object = simulate_kde(x = X, const.only = TRUE), class = "numeric")
  expect_is(object = simulate_kde(x = X, const.only = "TRUE"), class = "numeric")
  expect_is(object = simulate_kde(x = X, const.only = 1), class = "numeric")
  expect_silent(res <- simulate_kde(x = X, n = N, const.only = 0))
  expect_is(res, "list")
  expect_error(object = simulate_kde(x = X, const.only = "YES"))

})

## ----------------------------------------------------

context("argument test: seed")

test_that(desc = "non-parallel computing", code = {

  expect_silent(res.1 <- simulate_kde(x = x, n = n, seed = 17))
  expect_silent(res.2 <- simulate_kde(x = x, n = n, seed = 17))
  expect_identical(res.1$random.values, res.2$random.values)
  expect_condition(simulate_kde(x = x, n = n, seed = "seed"))

})

test_that(desc = "parallel computing", code = {

  skip("Please run some tests manually for parallel computing.")
  expect_silent(res.1 <- simulate_kde(x = x, n = n, seed = 17, parallel = TRUE))
  expect_silent(res.2 <- simulate_kde(x = x, n = n, seed = 17, parallel = TRUE))
  expect_identical(res.1$random.values, res.2$random.values)

})

## ----------------------------------------------------

context("data validation test")

test_that(desc = "univariate positive distribution", code = {

  for (distr in c("exp", "gamma", "lnorm", "weibull")) {
    expect_error(object = simulate_kde(x = c(-1, x), distr = distr))
  }

})

## ----------------------------------------------------

context("additional tests")

test_that(desc = "find_best_fit", code = {

  set.seed(1)
  x <- rweibull(n = 10000, shape = 2, scale = 1)
  expect_silent(fit <- find_best_fit(x = x, positive = TRUE, plot = FALSE))
  expect_identical(fit$distribution, "weibull")

})
