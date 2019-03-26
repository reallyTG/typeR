# This file split from "test-occSSx.R" 2015-02-20

# test_that code for occSStime functions

# library(testthat)

context("Single-season occupancy, time covars")

test_that("occSStime with logit link",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  BRS <- salamanders
  # Check dots passed to nlm
  expect_warning(occSStime(BRS, plot=FALSE, iterlim=4),
      "Convergence may not have been reached")

  res <- occSStime(BRS, p~.time, plot=FALSE)
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real),
       equals(c("psi", "p1", "p2", "p3", "p4", "p5")))
  expect_that(round(as.vector(res$real[, 1]), 4), # estimates
      equals(c(0.5799, 0.1769, 0.1327, 0.3980, 0.3537, 0.2653)))
  expect_that(round(as.vector(res$real[, -1]), 4), # CIs
      equals(c(0.3490, 0.0644, 0.0415, 0.1998, 0.1712, 0.1156,
               0.7804, 0.4013, 0.3506, 0.6364, 0.5920, 0.4993)))
  expect_that(round(AIC(res), 4), equals(167.7144))
      # These are the values returned by PRESENCE
  res <- occSStime(BRS, p~.time, ci=0.85, plot=FALSE)
  expect_that(round(as.vector(res$real), 4),
      equals(c(0.5799, 0.1769, 0.1327, 0.3980, 0.3537, 0.2653,
               0.4079, 0.0852, 0.0571, 0.2443, 0.2111, 0.1462,
               0.7344, 0.3314, 0.2786, 0.5747, 0.5283, 0.4323)))
  # Put in some NAs
  BRS[c(6,167,130,123,89,154,32,120,127,147)] <- NA
  res <- occSStime(BRS, p~.time, plot=FALSE)
  expect_that(round(as.vector(res$real), 4),
      equals(c(0.5637, 0.1930, 0.1365, 0.3812, 0.3450, 0.2383, 0.3223,
        0.0690, 0.0421, 0.1773, 0.1424, 0.0938, 0.7783, 0.4354, 0.3621, 0.6378,
        0.6257, 0.4861)))
  expect_that(round(AIC(res), 4), equals(153.1581))
  # Put in a row of NAs
  BRS[3,] <- NA
  expect_error(occSStime(BRS, p~.time, plot=FALSE),
    "Detection history has a row with all NAs")
  res <- occSStime(BRS, p~.time, plot=FALSE, verify=FALSE)
  expect_that(round(as.vector(res$real), 4),
      equals(c(0.5316, 0.2107, 0.0990, 0.4166, 0.3596, 0.2604, 0.3067,
        0.0758, 0.0238, 0.1952, 0.1514, 0.1031, 0.7444, 0.4650, 0.3308, 0.6778,
        0.6387, 0.5188)))
  expect_that(round(AIC(res), 4), equals(145.6360))
  # Put in a column of NAs
  BRS[, 3] <- NA
  res <- occSStime(BRS, p~.time, plot=FALSE, verify=FALSE)
  expect_that(round(res$real[, 1], 4),
      is_equivalent_to(c(0.3579, 0.3017, 0.1471,0.3017, 0.5434, 0.3969)))
  expect_that(as.vector(res$real[, 2:3]),
      is_equivalent_to(rep(NA_real_, 12)))
  expect_that(round(AIC(res), 4), equals(NA_real_))
  # All ones:
  tst <- matrix(1, 39, 5)
  res <- occSStime(tst, p~.time, plot=FALSE)
  expect_that(round(as.vector(res$real[,1]), 4),
      is_equivalent_to(rep(1, 6)))
  expect_that(as.vector(res$real[, 2:3]),
      is_equivalent_to(rep(NA_real_, 12)))
  expect_that(round(AIC(res), 4), equals(NA_real_))
  # All zeros:
  tst <- matrix(0, 39, 5)
  res <- occSStime(tst, p~.time, plot=FALSE)
  expect_that(as.vector(res$real),
      is_equivalent_to(rep(NA_real_, 18)))
  expect_that(AIC(res), equals(NA_real_))
  # All NAs:
  tst <- matrix(NA, 39, 5)
  res <- occSStime(tst, p~.time, plot=FALSE, verify=FALSE)
  expect_that(as.vector(res$real),
      is_equivalent_to(rep(NA_real_, 18)))
  expect_that(AIC(res),
      equals(NA_real_))

  # Linear trend
  BRS <- salamanders
  res <- occSStime(BRS, p~.Time, plot=FALSE)
  # Values returned by PRESENCE:
  expect_that(round(as.vector(t(res$real)), 4),
      equals(c( 0.5899, 0.3505, 0.7931,
                0.1865, 0.0881, 0.3523,
                0.2197, 0.1251, 0.3566,
                0.2569, 0.1604, 0.3849,
                0.2981, 0.1811, 0.4493,
                0.3428, 0.1860, 0.5436)))
  expect_that(round(AIC(res), 4), equals(165.9228))

  # Quadratic trend
  res <- occSStime(BRS, p~.Time + I(.Time^2), plot=FALSE)
  # Values returned by PRESENCE to within 0.0001
  expect_that(round(as.vector(t(res$real)), 4),
      equals(c( 0.5870, 0.3502, 0.7894,
                0.1321, 0.0461, 0.3242,
                0.2404, 0.1335, 0.3940,
                0.3210, 0.1801, 0.5043,
                0.3364, 0.1995, 0.5075,
                0.2807, 0.1304, 0.5039)))
  expect_that(round(AIC(res), 4), equals(166.3525))
}  )
# ......................................................................

test_that("occSStime with probit link",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  BRS <- salamanders
  res <- occSStime(BRS, p~.time, plot=FALSE, link="probit")
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real),
       equals(c("psi", "p1", "p2", "p3", "p4", "p5")))
  expect_that(round(as.vector(res$real[, 1]), 4), # estimates, same as logit
      equals(c(0.5799, 0.1769, 0.1327, 0.3980, 0.3537, 0.2653)))
  expect_that(round(as.vector(res$real[, -1]), 4), # CIs differ
      equals(c(0.3490, 0.0587, 0.0367, 0.1940, 0.1649, 0.1091,
               0.7856, 0.3863, 0.3309, 0.6353, 0.5887, 0.4908)))
  expect_that(round(AIC(res), 4), equals(167.7144))  # same

  # Linear trend
  BRS <- salamanders
  res <- occSStime(BRS, p~.Time, plot=FALSE, link="probit")
  expect_that(round(as.vector(res$real[, 1]), 4),
      equals(c(0.5900, 0.1841, 0.2190, 0.2574, 0.2991, 0.3435)))
  expect_that(round(AIC(res), 4), equals(165.8844))
  # These are NOT the same as the logit link results

  # Quadratic trend
  res <- occSStime(BRS, p~.Time + I(.Time^2), plot=FALSE, link="probit")
  expect_that(round(as.vector(res$real[, 1]), 4),
      equals(c(0.5869, 0.1345, 0.2431, 0.3185, 0.3330, 0.2825)))
  expect_that(round(AIC(res), 4), equals(166.4418))
}  )

