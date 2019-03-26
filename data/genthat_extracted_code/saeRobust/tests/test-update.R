context("update")
test_that("update", {

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

  out <- rfh(
    y ~ x, dat, "samplingVar", corSAR1(W),
    maxIter = 1, maxIterParam = 2, maxIterRe = 1
  )

  out <- update(out, maxIter = 2)

  outRef <- rfh(
    y ~ x, dat, "samplingVar", corSAR1(W),
    maxIter = 3, maxIterParam = 2, maxIterRe = 2
  )

  testthat::expect_equal(coef(out), coef(outRef))
  testthat::expect_equal(out$variance, outRef$variance)

  # This test cannot work because the starting values in out are different in
  # the second iteration - because of the parameter estimates
  # testthat::expect_equal(out$re, outRef$re)

  x <- cbind(1, dat$x)

  out <- fitrsfh(dat$y, x, dat$samplingVar, W,
                 maxIter = 1, maxIterParam = 2, maxIterRe = 1)

  out <- update(out, maxIter = 2)

  outRef <- fitrsfh(dat$y, x, dat$samplingVar, W,
                    maxIter = 3, maxIterParam = 2, maxIterRe = 1)

  testthat::expect_equal(coef(out), coef(outRef))
  testthat::expect_equal(out$variance, outRef$variance)

})
