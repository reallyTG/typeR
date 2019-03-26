context("rfh")

# Note that I do not test the correctness of the estimators. Here I only check
# if the public representation of the model object looks how I want them to. You
# can find some tests on the correctness of the estimation equations.

test_that("rfh is working", {

    library("saeSim")
    set.seed(1)
    dat <- base_id(10, 1) %>%
        sim_gen_e() %>%
        sim_gen_x() %>%
        sim_gen_v() %>%
        sim_resp_eq(y = 100 + 2 * x + v + e) %>%
        as.data.frame

    dat$samplingVar <- 1

    out <- rfh(y ~ x, dat, "samplingVar", maxIter = 1, maxIterRe = 1)

    summary(out)

    expect_is(out, "list")
    expect_is(out$coefficients, "numeric")
    expect_is(out$variance, "numeric")
    expect_is(out$samplingVar, "numeric")
    expect_is(out$y, "numeric")

})

test_that("rfh warnings and errors", {

    library("saeSim")
    set.seed(1)
    dat <- base_id(10, 1) %>%
        sim_gen_e() %>%
        sim_gen_x() %>%
        sim_gen_v() %>%
        sim_resp_eq(y = 100 + 2 * x + v + e) %>%
        as.data.frame

    dat$samplingVar <- 0

    expect_warning(
      rfh(y ~ x, dat, "samplingVar", maxIter = 1, maxIterRe = 1),
      "zero sampling variances"
    )

    dat$samplingVar <- NA
    
    expect_error(
      rfh(y ~ x, dat, "samplingVar", maxIter = 1, maxIterRe = 1),
      "Missing values"
    )

})

test_that("spatial rfh is working", {

  library("saeSim")
  set.seed(1)
  dat <- base_id(10, 1) %>%
    sim_gen_e() %>%
    sim_gen_x() %>%
    sim_gen_v() %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  dat$samplingVar <- 1

  W <- testRook(10)

  out <- rfh(y ~ x, dat, "samplingVar", corSAR1(W), maxIter = 1, maxIterRe = 1)
  expect_is(out, "list")
  expect_is(out$coefficients, "numeric")
  expect_is(out$variance, "numeric")
  expect_is(out$samplingVar, "numeric")
  expect_is(out$y, "numeric")
  testthat::expect_is(out$W, "matrix")

})

test_that("temporal rfh is working", {

  library("saeSim")
  set.seed(3)
  nDomains <- 20
  nTime <- 10
  dat <- base_id_temporal(nDomains, 1, nTime) %>%
    sim_gen_e(sd = 10) %>%
    sim_gen_x() %>%
    sim_gen_v(sd = 10) %>%
    sim_gen(gen_v_ar1(rho = 0.5, sd = 10, name = "ar")) %>%
    sim_resp_eq(y = 100 + 2 * x + v + ar + e) %>%
    as.data.frame

  dat$samplingVar <- rep(100, nrow(dat))

  out <- rfh(
    y ~ x, dat, "samplingVar", corAR1(nTime),
    maxIter = 1, maxIterParam = 1, maxIterRe = 1 # speed up
  )

  expect_is(out, "list")
  expect_is(out$coefficients, "numeric")
  expect_is(out$variance, "numeric")
  expect_is(out$samplingVar, "numeric")
  expect_is(out$y, "numeric")
  testthat::expect_is(out$nTime, "numeric")

})

test_that("temporal rfh is working", {

  library("saeSim")
  set.seed(3)
  nDomains <- 20
  nTime <- 10
  dat <- base_id_temporal(nDomains, 1, nTime) %>%
    sim_gen_e(sd = 4) %>%
    sim_gen_x() %>%
    sim_gen(gen_v_sar(sd = 4, name = "v")) %>%
    sim_gen(gen_v_ar1(rho = 0.5, sd = 4, name = "ar")) %>%
    sim_resp_eq(y = 100 + 2 * x + v + ar + e) %>%
    as.data.frame

  dat$samplingVar <- rep(16, nrow(dat))
  W <- testRook(nDomains)

  out <- rfh(
    y ~ x, dat, "samplingVar", corSAR1AR1(W = W, nTime = nTime),
    maxIter = 1, maxIterParam = 1, maxIterRe = 1 # speed up
  )

  expect_is(out, "list")
  expect_is(out$coefficients, "numeric")
  expect_is(out$variance, "numeric")
  expect_is(out$samplingVar, "numeric")
  expect_is(out$y, "numeric")
  testthat::expect_is(out$nTime, "numeric")
  testthat::expect_is(out$W, "matrix")

  # What do we expect here? Basically I just want to check that the code runs
  # without error:
  predict(out, type = c("reblup", "reblupbc"))

})

test_that("predict.rfh", {

    expectIs <- function(x, a) {
        testthat::expect_is(x, a)
    }

    expectEqual <- function(x, y) {
        testthat::expect_equal(x, y)
    }

    library("saeSim")
    set.seed(1)
    dat <- base_id(10, 1) %>%
        sim_gen_e(sd = 1) %>%
        sim_gen_x() %>%
        sim_gen_v(sd = 1) %>%
        sim_resp_eq(y = 100 + 2 * x + v + e) %>%
        as.data.frame

    dat$samplingVar <- 1

    modelFit <- rfh(y ~ x, dat, "samplingVar")
    out <- predict(modelFit)

    expectIs(out, "data.frame")
    expectIs(out$re, "numeric")
    expectEqual(
        as.numeric(out$reblup - out$re),
        as.numeric(modelFit$x %*% modelFit$coefficients)
    )

    out <- predict(modelFit)
    expectEqual(names(out), c("re", "direct", "reblup"))

    out <- predict(modelFit, "linear")
    expectEqual(names(out), c("re", "direct", "linear"))

})


