# This file split from "test-occSSx.R" 2015-02-20

# test_that code for occSS series of functions

# library(testthat)

context("Single-season occupancy, no covars")

test_that("occSS0 with logit link",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  BRS <- salamanders
  n <- rowSums(!is.na(BRS))
  y <- rowSums(BRS > 0, na.rm=TRUE)
  # Check dots passed to nlm
  expect_warning(occSS0(y, n, iterlim=4),
      "Convergence may not have been reached")
  brs1 <- occSS0(y, n)
  expect_that(class(brs1), equals(c("wiqid", "list")))
  expect_that(names(brs1), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
       "ci", "formulae", "index")))
  expect_that(is.call(brs1$call), is_true())
  expect_that(colnames(brs1$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(brs1$real), equals(c("psiHat", "pHat")))
  expect_that(round(as.vector(brs1$real[, 1]), 4),
      equals(c(0.5946, 0.2587))) # estimates
  expect_that(round(as.vector(brs1$real[, -1]), 4),
      equals(c(0.3512, 0.1622, 0.7990, 0.3863))) # CI
  expect_that(round(AIC(brs1), 4), equals(165.7586))
  # These are the values returned by PRESENCE

  # Check changing CI
  brs1a <- occSS0(y, n, 0.85)
  expect_that(round(as.vector(brs1a$real), 4),
      equals(c(0.5946, 0.2587, 0.4136, 0.1846, 0.7531, 0.3499)))

  # Put in some NAs
  BRS[c(6,167,130,123,89,154,32,120,127,147)] <- NA
  n <- rowSums(!is.na(BRS))
  y <- rowSums(BRS > 0, na.rm=TRUE)
  brs2 <-  occSS0(y, n)
  expect_that(round(as.vector(brs2$real), 4),
      equals(c(0.5861, 0.2445, 0.3238, 0.1422, 0.8073, 0.3872)))
  expect_that(round(AIC(brs2), 4), equals(149.7430))
  # Put in a row of NAs
  BRS[3,] <- NA
  n <- rowSums(!is.na(BRS))
  y <- rowSums(BRS > 0, na.rm=TRUE)
  brs3 <- occSS0(y, n)
  expect_that(round(as.vector(brs3$real), 4),
      equals(c(0.5558, 0.2531, 0.3095, 0.1475, 0.7775, 0.3989)))
  expect_that(round(AIC(brs3), 4), equals(144.1232))
  # Put in a column of NAs
  BRS[, 3] <- NA
  n <- rowSums(!is.na(BRS))
  y <- rowSums(BRS > 0, na.rm=TRUE)
  brs4 <-  occSS0(y, n)
  expect_that(round(as.vector(brs4$real), 4),
      equals(c(0.3798, 0.3160, 0.1918, 0.1644, 0.6124, 0.5204)))
  expect_that(round(AIC(brs4), 4), equals(101.1297))
  # All ones:
  brs5 <- occSS0(n, n)
  expect_that(round(as.vector(brs5$real), 4),
      equals(c(1, 1, NA_real_, NA_real_, NA_real_, NA_real_)))
  expect_that(AIC(brs5), equals(NA_real_))
  # All zeros:
  brs6 <- occSS0(rep(0, length(n)), n)
  expect_that(round(as.vector(brs6$real), 4),
      equals(c(0.0000, 0.0078, rep(NA_real_, 4))))
  # expect_that(round(AIC(brs6), 4), equals(4))
  expect_that(AIC(brs6), equals(NA_real_))
  # All NAs:
  brs7 <- occSS0(rep(0, length(n)), rep(0, length(n)))
  expect_that(as.vector(brs7$real),
      equals(rep(NA_real_, 6)))
  expect_that(AIC(brs7), equals(NA_real_))
}  )
# .........................................................................

test_that("occSS0 with probit link",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  BRS <- salamanders
  n <- rowSums(!is.na(BRS))
  y <- rowSums(BRS > 0, na.rm=TRUE)
  brs1 <- occSS0(y, n, link="probit")
  expect_that(class(brs1), equals(c("wiqid", "list")))
  expect_that(names(brs1), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
       "ci", "formulae", "index")))
  expect_that(is.call(brs1$call), is_true())
  expect_that(colnames(brs1$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(brs1$real), equals(c("psiHat", "pHat")))
  expect_that(round(as.vector(brs1$real[, 1]), 4),
      equals(c(0.5946, 0.2587))) # estimates, same as logit
  expect_that(round(as.vector(brs1$real[, -1]), 4),
      equals(c(0.3518, 0.1594, 0.8049, 0.3830))) # CI, not same
  expect_that(round(AIC(brs1), 4), equals(165.7586)) # same as logit
} )
