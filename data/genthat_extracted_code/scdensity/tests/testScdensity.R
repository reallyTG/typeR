# Tests for the main function scdensity()

library(scdensity)
context("Calls to the main function")

test_that("all bandwidth options work okay", {
  n <- 30
  x <- rlnorm(n)
  tst1 <- scdensity(x,bw="nrd0")
  tst2 <- scdensity(x,bw="nrd")
  tst3 <- scdensity(x,bw="ucv")
  tst4 <- scdensity(x,bw="bcv")
  tst5 <- scdensity(x,bw="SJ")
  tst6 <- scdensity(x,bw=0.3)
  expect_is(tst1, "scdensity")
  expect_is(tst2, "scdensity")
  expect_is(tst3, "scdensity")
  expect_is(tst4, "scdensity")
  expect_is(tst5, "scdensity")
  expect_is(tst6, "scdensity")
  expect_error(scdensity(x,bw="myBW"))
})

test_that("invalid constraint inputs are handled gracefully", {
  n <- 30
  x <- rlnorm(n)
  expect_warning(scdensity(x, constraint=c("unim", "nonexistent")))
  expect_warning(scdensity(x, constraint=c("unimodal","monotone")))
  expect_warning(scdensity(x, constraint=c("monotoneL","unimodal")),regexp="Redundant")
  expect_warning(scdensity(x, constraint=c("twoInflections+","unimodal")),regexp="Redundant")
  expect_error(scdensity(x, constraint=c("bimodal","unimodal")),regexp="incompatible")
})


test_that("Random well-behaved problem instances do give solutions (method=adjustedKDE).", {
  # avoid symmetric constraint in combination with bimodal or twoInflections+ constraint, as
  # these combinations are prone to numerical problems in solve.QP.
  skip_on_cran()
  make_problem <- function() {
    n <- sample(20:100, size=1)
    x <- rnorm(n)
    bw <- "SJ"
    cons <- c("unimodal", "twoInflections", "twoInflections+", "bimodal", "monotoneRightTail",
              "monotoneLeftTail")
    constraint <- sample(cons, size=1)
    if (constraint == "bimodal") {
      n <- ceiling(n/2)
      x <- c(rnorm(n, mean=-1, sd=1/2), rnorm(n, mean=1, sd=1/2))
      opts <- list()
    }
    if (constraint == "twoInflections+") {
      opts <- list()
    }

    if (constraint != "bimodal" && constraint != "twoInflections+") {
      pick <- sample(1:5, size=1)
      if (pick==1) {
        constraint <- c(constraint, "boundedLeft")
        opts <- list(lowerBound = -2.5)
      } else if (pick==2) {
        constraint <- c(constraint, "boundedRight")
        opts <- list(upperBound = 2.5)
      } else if (pick==3) {
        constraint <- c(constraint, "symmetric")
        opts <- list(pointOfSymmetry = 0)
      } else if (pick==4) {
        constraint <- c(constraint, "symmetric")
        opts <- list()
      } else {
        opts <- list()
      }
    }

    list(x = x, bw = bw, constraint = constraint, opts = opts, method="adjustedKDE")
  }

  # Increase the number of repetitions for more thorough testing.
  cat("testing random instances with adjustedKDE\n")
  for (i in 1:10) {
    cat(i, "\n")
    args <- make_problem()
    tst <- do.call("scdensity", args = args)
    expect_is(tst, "scdensity")
  }

})


test_that("Random well-behaved problem instances do give solutions (method=weightedKDE).", {
  # Use larger sample size here. Numerical problems more likely with this method, not related
  # to the code quality.
  skip_on_cran()
  make_problem <- function() {
    n <- sample(100:500, size=1)
    x <- rnorm(n)
    bw <- "SJ"
    cons <- c("unimodal", "twoInflections", "twoInflections+", "bimodal", "monotoneRightTail",
              "monotoneLeftTail")
    constraint <- sample(cons, size=1)
    if (constraint == "bimodal") {
      n <- ceiling(n/2)
      x <- c(rnorm(n, mean=-1, sd=1/2), rnorm(n, mean=1, sd=1/2))
      opts <- list()
    }
    if (constraint == "twoInflections+") {
      opts <- list()
    }

    if (constraint != "bimodal" && constraint != "twoInflections+") {
      pick <- sample(1:3, size=1)
      if (pick==1) {
        constraint <- c(constraint, "boundedLeft")
        opts <- list(lowerBound = -2.5)
      } else if (pick==2) {
        constraint <- c(constraint, "boundedRight")
        opts <- list(upperBound = 2.5)
      } else {
        opts <- list()
      }
    }

    list(x = x, bw = bw, constraint = constraint, opts = opts, method="weightedKDE")
  }

  # Increase the number of repetitions for more thorough testing.
  cat("testing random instances with weightedKDE\n")
  for (i in 1:10) {
    cat(i, "\n")
    args <- make_problem()
    tst <- do.call("scdensity", args = args)
    expect_is(tst, "scdensity")
  }

})
