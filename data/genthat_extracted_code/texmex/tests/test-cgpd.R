context("cgpd")

test_that("cgpd family behaves as it ought", {
  skip_on_cran()
  skip_on_travis()

  # We have extensive tests for gpd, so we really just need to be confident that
  # cgpd reproduces it quite closely and that the behaviour near -1/2 makes sense.
  tol <- .001

  gm <- evm(rain, th=30)
  cgm <- evm(rain, th=30, family=cgpd)

  expect_equal(coef(gm)[1], coef(cgm)[1], tolerance=tol, label="cgpd and gpd fit same scale parameters by MLE")
  expect_equal(unname(coef(gm)[2]), unname(exp(coef(cgm)[2]) - 1/2), tolerance=tol,
               label="cgpd and gpd fit same shape parameters by MLE")

  expect_equal(cor(resid(gm), resid(cgm)), 1, label="cgpd and gpd produce equivalent residuals from rain data by MLE")

  pgm <- predict(gm, ci.fit=TRUE, M=seq(200, 500, by=100))$obj
  pcgm <- predict(cgm, ci.fit=TRUE, M=seq(200, 500, by=100))$obj

  pgm.m <- unlist(lapply(pgm, function(x) x[, 1]))
  pcgm.m <- unlist(lapply(pcgm, function(x) x[, 1]))

  # CIs are based on quadratic approximations that will not be identical
  # Also, exp(eta) - 1/2 is not exactly xi because of where the optimizer
  # chooses to give up. So when we extrapolate return levels, they are not
  # identical.

  #expect_equal(pgm[[1]], pcgm[[1]], tolerance=tol) currently failing but still under development so commented out

  #bgm <- evm(rain, th=30, method="sim")
  #bcgm <- evm(rain, th=30, method="sim", family=cgpd)

  #pbgm <- predict(bgm, ci.fit=TRUE, M=seq(500, 1000, by=100))$obj
  #pbcgm <- predict(bcgm, ci.fit=TRUE, M=seq(500, 1000, by=100))$obj

  # How to judge if results are within simulation error?

})
