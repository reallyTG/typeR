
# test_that code for closedCap series of functions
#   which use a frequency vector

# library(testthat)

context("Closed captures/frequency")

test_that("closedCapM0 gives right answers",  {
  # Rabbit data from Edwards and Eberhart (1967)
  freq2 <- c(43, 16, 8, 6, 0, 2, 1, rep(0, 11))
  # Check dots passed to nlm
  expect_warning(closedCapM0(freq2, iterlim=4),
      "Convergence may not have been reached")
  res <- closedCapM0(freq2)
  resM <- closedCapM0(freq2, ciType='MARK')
  expect_that(class(res), equals(c("wiqid", "list"))) 
  expect_that(names(res), equals(c("call", "beta", "beta.vcv", "real", "logLik"))) 
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real), equals(c("Nhat", "phat")))
  expect_that(round(as.vector(res$real[1, ]), 4), 
      is_equivalent_to(c(96.2589, 86.4162, 115.4025)))
  expect_that(round(as.vector(resM$real[1, ]), 3), 
      is_equivalent_to(c(96.259, 86.606, 114.698)))
      # MARK gives 96.258770, 86.603278, 114.70669  
  expect_that(round(as.vector(res$real[2, ]), 4), 
      is_equivalent_to(c(0.0820, 0.0663, 0.1010)))
      # MARK gives 0.0819550 0.0662522 0.1009771 
  expect_that(round(as.vector(resM$real[2, ]), 4), 
      equals(round(as.vector(res$real[2, ]), 4)))
  expect_that(round(AIC(res), 4), equals(379.5941))
      # MARK gives 379.59414.
  expect_that(round(AIC(resM), 4),
      equals(round(AIC(res), 4)))
  res <- closedCapM0(freq2, ci=0.85)
  expect_that(round(as.vector(res$real), 4), 
      is_equivalent_to(c(96.2589, 0.0820, 88.4286, 0.0701, 109.0225, 0.0956)))

      # All zeros:
  res <- closedCapM0(rep(0, 18))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 6)))
  expect_that(AIC(res), equals(NA_real_))
  # Lots of captures, no recaptures
  res <- closedCapM0(c(30, rep(0, 17)))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 6)))
  expect_that(AIC(res), equals(NA_real_))
  # Just 1 animal recaptured
  res <- closedCapM0(c(0,1, rep(0, 16)))
  expect_that(round(as.vector(res$real),4), 
      is_equivalent_to(c(1, 0.1111, rep(NA_real_, 4))))
  expect_that(AIC(res), equals(NA_real_))
  # Just 2 animals recaptured
  res <- closedCapM0(c(0,2, rep(0, 16)))
  expect_that(signif(as.vector(res$real)[-5], 5), # 5th value is nonsense
      is_equivalent_to(c(2.0000e+00, 1.1111e-01,  2.0000e+00, 4.2336e-02,
          2.6114e-01)))
  expect_that(round(AIC(res), 4), equals(27.7296))
}  )
# .........................................................................

test_that("closedCapMh2 gives right answers",  {
  # Rabbit data from Edwards and Eberhart (1967)
  freq2 <- c(43, 16, 8, 6, 0, 2, 1, rep(0, 11))
  # Check dots passed to nlm
  expect_output(res <- closedCapMh2(freq2, print.level=2),
      "iteration")
  resM <- closedCapMh2(freq2, ciType="MARK")
  expect_that(class(res), equals(c("wiqid", "list"))) 
  expect_that(names(res), equals(c("call", "beta",  "beta.vcv", "real", "logLik"))) 
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real), equals(c("Nhat", "pmixHat","p1hat", "p2hat")))
  expect_that(round(as.vector(res$real[1, ]), 2),
      is_equivalent_to(c(135.48, 93.85, 274.21)))
  expect_that(round(as.vector(resM$real[1, ]), 2),
      is_equivalent_to(c(135.48, 95.62, 256.26)))
    # MARK gives 135.47714, 95.586384, 256.61168  
  expect_that(round(as.vector(res$real[-1, ]), 4),
      is_equivalent_to(c(0.1548, 0.1795, 0.0360, 0.0536, 0.1027,
                         0.0122, 0.3718, 0.2949, 0.1015)))
      # These are almost the same as the values returned by MARK.
  expect_that(round(as.vector(resM$real[-1, ]), 4),
      equals(round(as.vector(res$real[-1, ]), 4)))
  expect_that(round(AIC(res), 4), equals(369.6155))
    # Same as MARK
  expect_that(AIC(resM), equals(AIC(res)))
  # confidence interval != 0.95
  res <- closedCapMh2(freq2, 0.85)
  expect_that(signif(as.vector(res$real), 4),
      is_equivalent_to(c(135.5,   0.1548,  0.1795,   0.03602, 100.6,   0.07179,   0.1197,
   0.01632, 220.0,  0.3024,   0.2604,   0.07765)))
   # All zeros:
  res <- closedCapMh2(rep(0, 18))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 12)))
  expect_that(AIC(res), equals(NA_real_))
  # Lots of captures, no recaptures
  res <- closedCapMh2(c(30, rep(0, 17)))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 12)))
  expect_that(AIC(res), equals(NA_real_))
  # Just 1 animal recaptured
  res <- closedCapMh2(c(0,1, rep(0, 16)))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 12)))
  expect_that(AIC(res), equals(NA_real_))
  # Kanha tiger data
  data(KanhaTigers)
  res <- closedCapMh2(KanhaTigers)
  expect_that(signif(as.vector(res$real), 4),
      is_equivalent_to(c(3.152e+01, 4.920e-01, 2.644e-01, 1.061e-01, 2.629e+01,
        1.477e-02, 1.130e-01, 5.821e-03, 1.294e+02, 9.843e-01, 5.036e-01, 7.066e-01)))
  expect_that(round(AIC(res), 4), equals(158.6416))
}  )
# .........................................................................


test_that("closedCapMhJK gives right answers",  {
  # Rabbit data from Edwards and Eberhart (1967)
  freq2 <- c(43, 16, 8, 6, 0, 2, 1, rep(0, 11))
  res <- closedCapMhJK(freq2)
  expect_that(class(res), equals(c("wiqid", "list"))) 
  expect_that(names(res), equals(c("call", "real", "logLik"))) 
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real), equals(c("Nhat", "pHat")))
  expect_that(AIC(res), equals(NA_real_))
  expect_that(round(as.vector(res$real), 4), 
      is_equivalent_to(c(143.8743, 0.0548, 112.9113, 0.0393, 200.8106, 0.0699)))
      # These are almost the same as the rounded values returned by CAPTURE.
  res <- closedCapMhJK(freq2, 0.85)
  expect_that(round(as.vector(res$real), 4), 
      is_equivalent_to(c(143.8743, 0.0548, 119.3915, 0.0433, 182.1710, 0.0661)))

   # All zeros:
  res <- closedCapMhJK(rep(0, 18))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 6)))
  # Lots of captures, no recaptures
  res <- closedCapMhJK(c(30, rep(0, 17)))
  expect_that(as.vector(res$real), 
      is_equivalent_to(rep(NA_real_, 6)))
  # Just 1 animal recaptured
  res <- closedCapMhJK(c(0,1, rep(0, 16)))
  expect_that(round(as.vector(res$real), 4),
      is_equivalent_to(c(1.0000, 0.1111, 1.0000, 0.1111, 1.0000, 0.1111)))
  # Kanha tiger data
  res <- closedCapMhJK(KanhaTigers)
  expect_that(round(as.vector(res$real), 4), 
      is_equivalent_to(c(33.3188, 0.1741, 27.8792, 0.1064, 54.5044, 0.2080)))
}  )
# .........................................................................
