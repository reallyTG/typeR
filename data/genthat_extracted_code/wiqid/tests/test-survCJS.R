
# test_that code for survCJS series of functions

# library(testthat)
# test_file("test-cjs.R")
# test_file("wiqid/inst/tests/test-cjs.R")

context("CJS survival models")


test_that("survCJS gives right answers",  {
  # Data set (Lebreton et al dippers)
  data(dippers)
  DH <- dippers[, 1:7]
  # Check dots passed to nlm
  expect_warning(survCJS(DH, iterlim=4),
      "Convergence may not have been reached")
  res <- survCJS(DH)  # default is a phi(.) p(.) model
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "beta", "beta.vcv", "real", "logLik")))
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$beta), equals(c("phi: (Intercept)", "p: (Intercept)")))
  expect_that(round(as.vector(t(res$real[6:7,])), 4),
      equals(c(0.5602, 0.5105, 0.6088, 0.9026, 0.8305, 0.9460))) # MARK output
  expect_that(round(AIC(res), 4), equals(670.8377)) # MARK output

  res <- survCJS(DH, phi ~ .time)
  expect_that(rownames(res$beta), equals(c("phi: (Intercept)", "phi: .time2",
          "phi: .time3", "phi: .time4", "phi: .time5", "phi: .time6",
          "p: (Intercept)")))
  expect_that(round(as.vector(t(res$real[1:7,])), 4),
      equals(c(0.6258, 0.3965, 0.8098,
               0.4542, 0.3295, 0.5849,
               0.4784, 0.3669, 0.5921,
               0.6244, 0.5079, 0.7281,
               0.6079, 0.4970, 0.7088,
               0.5833, 0.4688, 0.6895,
               0.9021, 0.8286, 0.9461)))# MARK output
  expect_that(round(AIC(res), 4), equals(673.7301)) # MARK output

  dd <- data.frame(flood = c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE))
  res <- survCJS(DH, phi ~ flood, data=dd)
  expect_that(rownames(res$beta), equals(c("phi: (Intercept)", "phi: floodTRUE",
          "p: (Intercept)")))
  expect_that(round(as.vector(t(res$real[c(1,2,7),])), 4),
      equals(c(0.6071, 0.5451, 0.6658,
               0.4688, 0.3858, 0.5537,
               0.8998, 0.8262, 0.9443)))   # MARK output
  expect_that(round(AIC(res), 4), equals(666.1028)) # MARK output

  res <- survCJS(DH, phi ~ flood, data=dd, ci=0.85)
  expect_that(round(as.vector(t(res$real[c(1,2,7),])), 4),
      equals(c(0.6071, 0.5618, 0.6507,
               0.4688, 0.4074, 0.5312,
               0.8998, 0.8491, 0.9348)))
  expect_that(round(AIC(res), 4), equals(666.1028)) # MARK output

  res <- survCJS(DH, phi ~ flood*group, data=dd, group=dippers$sex)
  expect_that(rownames(res$beta), equals(c("phi: (Intercept)", "phi: floodTRUE",
          "phi: groupM", "phi: floodTRUE:groupM", "p: (Intercept)")))
  expect_that(round(as.vector(t(res$real[c(1,2,7, 8, 13),])), 4),
      equals(c( 0.6033, 0.5163, 0.6842,
                0.4568, 0.3468, 0.5712,
                0.6108, 0.5246, 0.6906,
                0.4833, 0.3612, 0.6073,
                0.8999, 0.8263, 0.9444)))  # MARK output
  expect_that(round(AIC(res), 4), equals(669.9911)) # MARK output
  
  # Check with unequal intervals
  DH1 <- DH[, -5]
  res1 <- survCJS(DH1, phi ~ .time, interval = c(1,1,1,2,1))
  expect_equal(rownames(res1$beta), c("phi: (Intercept)", "phi: .time2",
          "phi: .time3", "phi: .time4", "phi: .time5", "p: (Intercept)"))
  expect_equivalent(round(colMeans(res1$real), 4), c(0.7120, 0.5789, 0.8121))
  expect_equal(round(AIC(res1), 4), 520.4062)
}  )
# .........................................................................



