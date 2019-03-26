
# test_that code for occSS series of functions

# library(testthat)
# test_file("test-occSS.R")
# test_file("wiqid/inst/tests/test-occSS.R")

context("Royle-Nichols models")

test_that("occSSrn with logit",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  BRS <- salamanders
  # Check dots passed to nlm
  expect_warning(occSSrn(BRS, iterlim=4),
      "Convergence may not have been reached")

  res <- occSSrn(BRS)

  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real),
       equals(c("psiHat", "lambdaHat", "rHat")))
  expect_that(round(as.vector(res$real), 4),
      is_equivalent_to(c(0.6810, 1.1425, 0.1475, 0.3772, 0.4735, 0.0581, 0.9365,
          2.7568, 0.3266)))
  expect_that(round(AIC(res), 4), equals(164.0016))
      # These are the values returned by PRESENCE
  res <- occSSrn(BRS, ci=0.85)
  expect_that(round(as.vector(res$real), 4),
      is_equivalent_to(c(0.6810, 1.1425, 0.1475, 0.4502, 0.5983, 0.0750,
                         0.8872, 2.1819, 0.2695)))
  # Put in some NAs
  BRS[c(6,167,130,123,89,154,32,120,127,147)] <- NA
  res <- occSSrn(BRS)
  expect_that(round(as.vector(res$real), 4),
      is_equivalent_to(c(0.6739, 1.1204, 0.1383, 0.3402, 0.4159, 0.0473, 0.9511,
          3.0186, 0.3414)))
  expect_that(round(AIC(res), 4), equals(148.5542))
  # Put in a row of NAs
  BRS[3,] <- NA
  expect_error(occSSrn(BRS),
    "Detection history has a row with all NAs")
  # Put in a column of NAs
  BRS <- salamanders
  BRS[, 3] <- NA
  res <- occSSrn(BRS)
  expect_that(round(as.vector(res$real), 4),
      is_equivalent_to(c(0.4617, 0.6193, 0.2330, 0.2345, 0.2672, 0.0966,
        0.7619, 1.4352, 0.4634)))
  expect_that(round(AIC(res), 4), equals(119.2219))
  # All ones:
  res <- occSSrn(matrix(1, 39, 5))
  expect_that(as.vector(res$real),
      is_equivalent_to(rep(NA_real_, 9)))
  expect_that(AIC(res), equals(NA_real_))
  # All zeros:
  res <- occSSrn(matrix(0, 39, 5))
  expect_that(as.vector(res$real),
      is_equivalent_to(rep(NA_real_, 9)))
  expect_that(AIC(res), equals(NA_real_))
  # All NAs:
  res <- occSSrn(matrix(NA, 39, 5), verify=FALSE)
  expect_that(as.vector(res$real),
      is_equivalent_to(rep(NA_real_, 9)))
  expect_that(AIC(res),
      equals(NA_real_))
}  )
# ....................................................................

test_that("occSSrn with probit",  {
  # Data set (Blue Ridge Salamanders)
  require(wiqid)
  data(salamanders)
  BRS <- salamanders
  resp <- occSSrn(BRS, link='p')

  expect_that(class(resp), equals(c("wiqid", "list")))
  expect_that(names(resp), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index")))
  expect_that(is.call(resp$call), is_true())
  expect_that(colnames(resp$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(resp$real),
       equals(c("psiHat", "lambdaHat", "rHat")))
  expect_that(round(as.vector(resp$real[, 1]), 4),
      is_equivalent_to(c(0.6810, 1.1425, 0.1475)))
  expect_that(round(as.vector(resp$real[, -1]), 4),
      is_equivalent_to(c(0.3771, 0.4734, 0.0537, 0.9365, 2.7571, 0.3139)))
  expect_that(round(AIC(resp), 4), equals(164.0016))
}  )
# ....................................................................

test_that("occSSrnSite with logit",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  y <- rowSums(DH, na.rm=TRUE)
  n <- rowSums(!is.na(DH))
  # Check dots passed to nlm
  expect_warning(occSSrnSite(y, n, iterlim=4),
      "Convergence may not have been reached")

  res <- occSSrnSite(y, n)
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real)[c(1, 72, 73, 145)] ,
       equals(c("psi:1", "psi:72", "lambda:1", "r:1")))
  expect_that(round(as.vector(res$real[c(1, 73, 145), ]), 4),
      is_equivalent_to(c(0.6873, 1.1626, 0.2092, 0.4542, 0.6055, 0.1050,
        0.8927, 2.2324, 0.3736)))
  expect_that(round(AIC(res), 4), equals(264.7698))
      # These are the values returned by PRESENCE +/- 0.0001

  res <- occSSrnSite(y, n, lambda ~ Browsed, data=weta)
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real)[c(1, 72, 73, 145)] ,
       equals(c("psi:1", "psi:72", "lambda:1", "r:1")))
  expect_that(round(as.vector(res$real[c(1, 4, 73, 76, 145, 148), ]), 4),
      is_equivalent_to(c(0.7944, 0.5936, 1.5820, 0.9004, 0.1986, 0.1986,
        0.5276, 0.3374, 0.7500, 0.4116, 0.0952, 0.0952, 0.9644, 0.8605,
        3.3368, 1.9697, 0.3684, 0.3684)))
      # These are the values returned by PRESENCE +/- 0.0004.
  expect_that(round(AIC(res), 4), equals(263.7234))
      # This is the same as PRESENCE

  res <- occSSrnSite(y, n, r ~ Browsed, data=weta)
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real)[c(1, 72, 73, 145)] ,
       equals(c("psi:1", "psi:72", "lambda:1", "r:1")))
  expect_that(round(as.vector(res$real[c(1, 4, 73, 76, 145, 148), ]), 4),
      is_equivalent_to(c(0.7381, 0.7381, 1.3399, 1.3399, 0.2205, 0.1426,
          0.4700, 0.4700, 0.6349, 0.6349, 0.1020, 0.0545, 0.9409, 0.9409,
          2.8281, 2.8281, 0.4132, 0.3243)))
      # These are the values returned by PRESENCE +/- 0.0006.
  expect_that(round(AIC(res), 4), equals(265.0582))
      # This is the same as PRESENCE

  res <- occSSrnSite(y, n, c(lambda~ Browsed, r ~ Browsed), data=weta)
  expect_that(class(res), equals(c("wiqid", "list")))
  expect_that(names(res), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(is.call(res$call), is_true())
  expect_that(colnames(res$real), equals(c("est", "lowCI", "uppCI")))
  expect_that(rownames(res$real)[c(1, 72, 73, 145)] ,
       equals(c("psi:1", "psi:72", "lambda:1", "r:1")))
  expect_that(round(as.vector(res$real[c(1, 4, 73, 76, 145, 148), ]), 4),
      is_equivalent_to(c(0.8613, 0.5320, 1.9756, 0.7593, 0.1567, 0.2426,
          0.4380, 0.2777, 0.5763, 0.3253, 0.0416, 0.0971, 0.9989, 0.8300,
          6.7726, 1.7721, 0.4428, 0.4881)))
      # These are the values returned by PRESENCE +/- 0.003, except for
      # psi(Unbrowsed), where PRESENCE is a bit tighter.
  expect_that(round(AIC(res), 4), equals(265.3521))
      # This is the same as PRESENCE
}  )
# ....................................................................

test_that("occSSrnSite with probit",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  y <- rowSums(DH, na.rm=TRUE)
  n <- rowSums(!is.na(DH))

  resp <- occSSrnSite(y, n, link='probit')
  expect_that(rownames(resp$real)[c(1, 72, 73, 145)] ,
       equals(c("psi:1", "psi:72", "lambda:1", "r:1")))
  expect_that(round(as.vector(resp$real[c(1, 73, 145), 1]), 4),
      is_equivalent_to(c(0.6873, 1.1626, 0.2092)))
  expect_that(round(as.vector(resp$real[c(1, 73, 145), -1]), 4),
      is_equivalent_to(c(0.4541, 0.6054, 0.1008, 0.8927, 2.2326, 0.3664)))
  expect_that(round(AIC(resp), 4), equals(264.7698))

  resp <- occSSrnSite(y, n, lambda ~ Browsed, data=weta, link='p')
  expect_that(round(as.vector(resp$real[c(1, 4, 73, 76, 145, 148), 1]), 4),
      is_equivalent_to(c(0.7944, 0.5936, 1.5820, 0.9004, 0.1986, 0.1986)))
  expect_that(round(as.vector(resp$real[c(1, 4, 73, 76, 145, 148), -1]), 4),
      is_equivalent_to(c(0.5276, 0.3374, 0.7499, 0.4116, 0.0908, 0.0908,
                         0.9645, 0.8605, 3.3371, 1.9698, 0.3602, 0.3602)))
  expect_that(round(AIC(resp), 4), equals(263.7234))

  resp <- occSSrnSite(y, n, r ~ Browsed, data=weta, link='p')
  expect_that(round(as.vector(resp$real[c(1, 4, 73, 76, 145, 148), 1]), 4),
      is_equivalent_to(c(0.7381, 0.7381, 1.3399, 1.3399, 0.2205, 0.1426)))
  expect_that(round(as.vector(resp$real[c(1, 4, 73, 76, 145, 148), -1]), 4),
      is_equivalent_to(c(0.4699, 0.4699, 0.6348, 0.6348, 0.0969, 0.0502,
                         0.9409, 0.9409, 2.8284, 2.8284, 0.4045, 0.3108)))
  expect_that(round(AIC(resp), 4), equals(265.0582))
      # This is the same as PRESENCE

  resp <- occSSrnSite(y, n, c(lambda~ Browsed, r ~ Browsed), data=weta, link='p')
  expect_that(round(as.vector(resp$real[c(1, 4, 73, 76, 145, 148), 1]), 4),
      is_equivalent_to(c(0.8613, 0.5320, 1.9755, 0.7593, 0.1567, 0.2426)))
  expect_that(round(as.vector(resp$real[c(1, 4, 73, 76, 145, 148), -1]), 4),
      is_equivalent_to(c(0.4379, 0.2777, 0.5760, 0.3253, 0.0353, 0.0903,
                         0.9989, 0.8301, 6.7754, 1.7723, 0.4177, 0.4773)))
  expect_that(round(AIC(resp), 4), equals(265.3521))
}  )
# ....................................................................

