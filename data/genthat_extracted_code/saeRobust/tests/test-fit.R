context("fit")

test_that("rfhfit is working", {
  library("saeSim")
  set.seed(2)
  dat <- base_id(100, 1) %>%
    sim_gen_e() %>%
    sim_gen_x() %>%
    sim_gen_v() %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  y <- dat$y
  X <- cbind(1, dat$x)
  samplingVar <- rep(16, nrow(dat))

  out <- saeRobust:::fitrfh(y, X, samplingVar)
  expect_is(out, "list")
  expect_is(out$coefficients, "numeric")
  expect_is(out$variance, "numeric")

  testthat::expect_equal(
    sum(score(out)$delta, score(out)$beta),
    0, tolerance = 1e-04
  )

})

test_that("fitrsfh is working", {
  library("saeSim")
  set.seed(2)
  nDomains <- 40
  dat <- base_id(nDomains, 1) %>%
    sim_gen_e() %>%
    sim_gen_x() %>%
    sim_gen(gen_v_sar(rho = 0.5, sd = 4, name = "v")) %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  y <- dat$y
  X <- cbind(1, dat$x)
  samplingVar <- rep(16, nrow(dat))
  W <- spdep::nb2mat(spdep::cell2nb(nDomains, 1, "rook"), style = "W")

  out <- saeRobust:::fitrsfh(
    y, X, samplingVar, W, x0Var = c(0.5, 16),
    maxIter = 100, maxIterParam = 1, maxIterRe = 1 # speed up
  )
  # lapply(out$iterations, nrow)
  # out$variance
  # out$iterations$correlation
  # score(out)$delta

  # Atlas - OpenBLAS - and standard BLAS all have different results. Maybe we
  # should use the mean?
  # testthat::expect_equal(
  #   out$variance[2], 15.28,
  #   tolerance = 1e-03, check.attributes = FALSE
  # )
  #
  # testthat::expect_equal(
  #   out$variance[1], 0.742,
  #   tolerance = 1e-03, check.attributes = FALSE
  # )

  expect_is(out, "list")
  expect_is(out$coefficients, "numeric")
  expect_is(out$variance, "numeric")

  testthat::expect_equal(sum(score(out)$delta), 0, tolerance = 1.5e-04)

})

test_that("fitrtfh", {
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

  y <- dat$y
  x <- cbind(1, dat$x)
  samplingVar <- rep(100, nrow(dat))

  out <- saeRobust:::fitrtfh(
    y, x, samplingVar, nTime = nTime, x0Var = c(0.5, 100, 100),
    maxIter = 100, maxIterParam = 20, maxIterRe = 1 # speed up
  )

  # lapply(out$iterations, nrow)
  # out$variance
  # out$iterations$correlation
  # out$iterations$variance
  testthat::expect_equal(sum(score(out)$delta), 0, tolerance = 1e-05)

})

test_that("fitrtfh", {
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

  y <- dat$y
  x <- cbind(1, dat$x)
  samplingVar <- rep(16, nrow(dat))
  W <- testRook(nDomains)

  out <- saeRobust:::fitrstfh(
    y, x, samplingVar, nTime = nTime, W, x0Var = c(0.3, 0.5, 16, 16),
    maxIter = 100, maxIterParam = 5, maxIterRe = 1 # speed up
  )

  # lapply(out$iterations, nrow)
  # out$variance
  # out$iterations$SAR
  # out$iterations$AR
  # out$iterations$variance
  # score(out)$delta
  testthat::expect_equal(sum(score(out)$delta), 0, tolerance = 1e-04)

})

