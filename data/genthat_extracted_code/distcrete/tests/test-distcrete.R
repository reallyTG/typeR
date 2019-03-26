context("distcrete")

EPS <- 1e-12

test_that("basic", {
  shape <- 3
  rate <- 1.15

  for (w in c(0, 0.25, 0.5, 0.99)) {
    d <- distcrete("gamma", 1, shape, rate, w = w)
    x <- seq(0, 20, by = d$interval)

    expect_equal(sum(d$d(x)), d$cdf(max(x) + 1 - w), tolerance = EPS)
    px <- d$p(x)
    if (w == 0) {
      expect_equal(px, d$cdf(x + 1), tolerance = EPS)
    }

    expect_equal(d$q(px), x, tolerance = EPS)
    expect_equal(d$p(d$q(px)), px, tolerance = EPS)
  }
})

## This is the simplest case; the distribution is defined over the
## infinite interval so there is basically no information loss as we
## move among the different representations of data.
test_that("infinite domain distribution", {
  dx <- 0.1
  x1 <- seq(-5, 5, by = dx) # Covering almost the whole range
  x2 <- seq(-1, 2, by = dx) # Covering just the high density region

  for (w in c(0, 1/3, 0.5, 1)) {
    d <- distcrete("norm", dx, w = w)

    ## Check that we're targeting the correct distribution
    expect_equal(d$cdf(x1), pnorm(x1), tolerance = EPS)

    p1 <- d$d(x1)
    p2 <- d$d(x2)
    ## This is the total range that we cover:
    r1 <- c(min(x1) - dx * w, max(x1) + dx * (1 - w))
    r2 <- c(min(x2) - dx * w, max(x2) + dx * (1 - w))
    expect_equal(sum(p1), diff(d$cdf(r1)), tolerance = EPS)
    expect_equal(sum(p2), diff(d$cdf(r2)), tolerance = EPS)

    ## p and q functions can roundtrip appropriately
    px1 <- d$p(x1)
    expect_equal(d$q(px1), x1, tolerance = EPS)
    expect_equal(d$p(d$q(px1)), px1, tolerance = EPS)

    px2 <- d$p(x2)
    expect_equal(d$q(px2), x2, tolerance = EPS)
    expect_equal(d$p(d$q(px2)), px2, tolerance = EPS)

    expect_equal(d$cdf(r1[[1]]) + cumsum(p1),
                 d$cdf(x1 + dx * (1 - w)), tolerance = EPS)
    expect_equal(d$cdf(r2[[1]]) + cumsum(p2),
                 d$cdf(x2 + dx * (1 - w)), tolerance = EPS)
  }
})

## Next up, let's get a semi-infinite case tested.  This is a bit
## nastier because we need to deal with information loss on the left
## boundary.
test_that("semi-infinite domain distribution", {
  dx <- 0.1
  x1 <- seq(0, 10, by = dx) # Covering almost the whole range
  x2 <- seq(0, 4, by = dx) # Covering just the high density region
  shape <- 3
  rate <- 1.15

  for (w in c(0, 1/3, 0.5, 1)) {
    d <- distcrete("gamma", dx, shape, rate, w = w)

    ## Check that we're targeting the correct distribution:
    expect_equal(d$cdf(x1), pgamma(x1, shape, rate), tolerance = EPS)

    p1 <- d$d(x1)
    p2 <- d$d(x2)

    ## This is the total range that we cover:
    r1 <- c(min(x1) - dx * w, max(x1) + dx * (1 - w))
    r2 <- c(min(x2) - dx * w, max(x2) + dx * (1 - w))
    expect_equal(sum(p1), diff(d$cdf(r1)), tolerance = EPS)
    expect_equal(sum(p2), diff(d$cdf(r2)), tolerance = EPS)

    ## p and q functions can roundtrip appropriately
    px1 <- d$p(x1)
    expect_equal(d$q(px1), x1, tolerance = EPS)
    expect_equal(d$p(d$q(px1)), px1, tolerance = EPS)

    px2 <- d$p(x2)
    expect_equal(d$q(px2), x2, tolerance = EPS)
    expect_equal(d$p(d$q(px2)), px2, tolerance = EPS)

    expect_equal(d$cdf(r1[[1]]) + cumsum(p1),
                 d$cdf(x1 + dx * (1 - w)), tolerance = EPS)
    expect_equal(d$cdf(r2[[1]]) + cumsum(p2),
                 d$cdf(x2 + dx * (1 - w)), tolerance = EPS)
  }
})

## With a uniform distribution it should be pretty easy to work with
## this, except that the _pair_ boundaries make it very lossy
## unfortunately.
test_that("boundary conditions", {
  dx <- 0.1
  x <- seq(0, 1, by = dx)
  n <- length(x)

  for (w in c(0, 1/3, 0.5, 1)) {
    d <- distcrete("unif", dx, w = w)

    ## Check that we're targeting the correct distribution
    expect_equal(d$cdf(x), punif(x), tolerance = EPS)

    p <- d$d(x)
    r <- c(min(x) - dx * w, max(x) + dx * (1 - w))
    expect_equal(sum(p), diff(d$cdf(r)), tolerance = EPS)

    ## p and q functions can roundtrip appropriately
    px <- d$p(x)
    qpx <- d$q(px)
    if (w < 1) {
      expect_equal(qpx, c(x[-n], x[n - 1]), tolerance = EPS)
    } else {
      expect_equal(qpx, x)
    }

    if (w > 0 && w < 1) {
      expect_equal(d$p(qpx), c(px[-n], px[n - 1]), tolerance = EPS)
    } else {
      expect_equal(d$p(qpx), px, tolerance = EPS)
    }

    expect_equal(d$cdf(r[[1]]) + cumsum(p),
                 d$cdf(x + dx * (1 - w)), tolerance = EPS)
  }
})

test_that("out of bounds", {
  dx <- 0.1
  x <- seq(0, 1, by = dx)
  w <- 0
  d <- distcrete("unif", dx, w = w)

  ## The CDF is defined over the whole interval
  expect_equal(d$p(-1), 0) # same as punif(-1)
  expect_equal(d$p(2), 1) # same as punif(2)

  ## The PDF is also defined over this interval
  expect_equal(d$d(-1), 0) # same as dunif(-1)
  expect_equal(d$d(2), 0) # same as dunif(2)

  ## The quantile function is not though
  expect_equal(suppressWarnings(d$q(-1)), NaN) # same as qunif(-1)
  expect_equal(suppressWarnings(d$q(2)), NaN) # same as dunif(2)
})

test_that("strict mode", {
  dx <- 0.1
  x <- seq(0, 1, by = dx)
  w <- 0
  d <- distcrete("unif", dx, w = w)

  expect_error(d$p(dx / 2, strict = TRUE),
               "Values do not align")
  expect_error(d$d(dx / 2, strict = TRUE),
               "Values do not align")
})

test_that("random number generation", {
  dx <- 0.1
  x <- seq(0, 1, by = dx)
  for (w in c(0, 1/3, 0.5, 1)) {
    d <- distcrete("unif", dx, w = w)

    p <- runif(10000)
    table(d$q(p))
    table(d$q(p) + d$interval)

    z <- d$r(1000)
    expect_true(all(z %in% x))
    r <- c(if (w < 1) 0.0 else 0.1,
           if (w > 0) 1.0 else 0.9)
    expect_equal(range(z), r)
  }
})

test_that("logspace", {
  shape <- 3
  rate <- 1.15
  d <- distcrete("gamma", 1, shape, rate, w = 0)
  x <- seq(0, 20, by = d$interval)

  expect_equal(d$d(x, log = TRUE), log(d$d(x)))

  ## Step it out to bigger values and see if we can help:
  xx <- c(20, 30, 40, 50)

  p <- d$d(xx, log = TRUE)
  expect_true(all(is.finite(p)))
  expect_true(all(p < dgamma(xx, shape, rate, log = TRUE)))

  p2 <- d$d(xx)
  i <- p2 == 0
  expect_true(any(i))
  expect_equal(exp(p[!i]), p2[!i])
})

test_that("print method, no args", {
  d <- distcrete("norm", 1)
  capture.output(expect_identical(d, print(d)))
  str <- capture.output(print(d))
  expect_match(str, "name: norm", all = FALSE)
  expect_match(str, "with no parameters", all = FALSE)
})

test_that("print method, withargs", {
  d <- distcrete("norm", 1, mean = 1)
  capture.output(expect_identical(d, print(d)))
  str <- capture.output(print(d))
  expect_match(str, "name: norm", all = FALSE)
  expect_match(str, "mean: 1", all = FALSE)

  ## Unnamed:
  expect_equal(capture.output(print(distcrete("norm", 1, 1))), str)
})
