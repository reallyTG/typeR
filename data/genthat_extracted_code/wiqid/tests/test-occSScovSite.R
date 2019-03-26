# This file split from "test-occSS.R" 2015-02-20

# More test_that code for occSS series of functions

context("Single-season occupancy, site covars")

test_that("occSScovSite with logit link",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  y <- rowSums(DH, na.rm=TRUE)
  n <- rowSums(!is.na(DH))
  weta.covs <- weta[, 6, drop=FALSE]
  # Check dots passed to nlm
  expect_warning(occSScovSite(y, n, iterlim=4),
      "Convergence may not have been reached")

  weta1 <- occSScovSite(y, n)

  expect_that(class(weta1), equals(c("wiqid", "list")))
  expect_that(names(weta1), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))
  expect_that(is.call(weta1$call), is_true())

  expect_that(dim(weta1$beta), equals(c(2, 4)))
  expect_that(colnames(weta1$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta1$beta),
    equals(c("psi: (Intercept)", "p: (Intercept)")))
  expect_that(round(as.vector(weta1$beta), 4),
      equals(c(0.4751, -0.6218,  0.3746,  0.2364, -0.2590, -1.0851,  1.2093, -0.1585)))

  expect_that(dim(weta1$real), equals(c(144, 3)))
  expect_that(colnames(weta1$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(weta1$real[1, ]), 4),
      equals(c(0.6166, 0.4356, 0.7702)))
  expect_that(round(as.vector(weta1$real[73, ]), 4),
      equals(c(0.3494, 0.2525, 0.4604)))
  expect_that(round(AIC(weta1), 4),
      equals(265.7872))

  weta1a <- occSScovSite(y, n, ci=0.85)
  expect_that(round(as.vector(weta1a$real[1, ]), 4),
      equals(c(0.6166, 0.4840, 0.7339)))
  expect_that(round(as.vector(weta1a$real[73, ]), 4),
      equals(c(0.3494, 0.2765, 0.4301)))

  weta2 <- occSScovSite(y, n, psi ~ Browsed, data=weta.covs)

  expect_that(names(weta2), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))

  expect_that(dim(weta2$beta), equals(c(3, 4)))
  expect_that(colnames(weta2$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta2$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)")))
  # expect_that(round(as.vector(weta2$beta), 4),
      # equals(c(0.5196, 0.6167, -0.6223,  0.4188,  0.3627,  0.2367, -0.3012,
              # -0.0942, -1.0861, 1.3403,  1.3276, -0.1584)))

  expect_that(dim(weta2$real), equals(c(144, 3)))
  expect_that(colnames(weta2$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(weta2$real[1, ]), 4),
      equals(c(0.7594, 0.4660, 0.9194)))
  expect_that(round(as.vector(weta2$real[4, ]), 4),
      equals(c(0.4810, 0.2843, 0.6837)))
  expect_that(round(as.vector(weta2$real[73, ]), 4),
      equals(c(0.3493,  0.2524, 0.4605)))
  expect_that(round(AIC(weta2), 4),
      equals(264.2643))

  weta3 <- occSScovSite(y, n, list(psi ~ Browsed, p ~ Browsed), data=weta.covs)

  expect_that(names(weta3), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))

  expect_that(dim(weta3$beta), equals(c(4, 4)))
  expect_that(colnames(weta3$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta3$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)", "p: BrowsedTRUE")))
  # expect_that(round(as.vector(weta3$beta), 4),
      # equals(c( 0.5180,  0.6030, -0.6260,  0.0149,  0.4168,  0.4236,  0.2446,
                # 0.2446, -0.2989, -0.2273, -1.1054, -0.4645,  1.3349,  1.4333,
               # -0.1465,  0.4943)))
  expect_that(dim(weta3$real), equals(c(144, 3)))
  expect_that(colnames(weta3$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(weta3$real[1, ]), 4),
      equals(c(0.7565, 0.4438, 0.9237))) # PRESENCE last value is 0.9236
  expect_that(round(as.vector(weta3$real[4, ]), 4),
      equals(c(0.4839, 0.2691, 0.7048)))
  expect_that(round(as.vector(weta3$real[73, ]), 4),
      equals(c(0.3519, 0.2309, 0.4954)))
  expect_that(round(as.vector(weta3$real[76, ]), 4),
      equals(c(0.3452, 0.2000, 0.5264))) # PRESENCE last value is 0.5263
  expect_that(round(AIC(weta3), 4),
      equals(266.2606))
})
# .....................................................................

test_that("occSScovSite with probit link",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  y <- rowSums(DH, na.rm=TRUE)
  n <- rowSums(!is.na(DH))
  weta.covs <- weta[, 6, drop=FALSE]
  weta1p <- occSScovSite(y, n, link='probit')

  expect_that(class(weta1p), equals(c("wiqid", "list")))
  expect_that(names(weta1p), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))
  expect_that(is.call(weta1p$call), is_true())

  expect_that(dim(weta1p$beta), equals(c(2, 4)))
  expect_that(colnames(weta1p$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta1p$beta),
    equals(c("psi: (Intercept)", "p: (Intercept)")))
  expect_that(round(as.vector(weta1p$beta), 4),
      equals(c( 0.2966, -0.3870,  0.2319,  0.1452,
               -0.1581, -0.6716,  0.7512, -0.1025)))

  expect_that(dim(weta1p$real), equals(c(144, 3)))
  expect_that(colnames(weta1p$real),
    equals(c("est", "lowCI", "uppCI")))
  expect_that(round(as.vector(weta1p$real[1, ]), 4),
      equals(c(0.6166, 0.4372, 0.7737)))
  expect_that(round(as.vector(weta1p$real[73, ]), 4),
      equals(c(0.3494, 0.2509, 0.4592)))
  expect_that(round(AIC(weta1p), 4),
      equals(265.7872))

  weta2p <- occSScovSite(y, n, psi ~ Browsed, data=weta.covs, link='p')
  expect_that(names(weta2p), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))
  expect_that(dim(weta2p$beta), equals(c(3, 4)))
  expect_that(colnames(weta2p$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta2p$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)")))
  # expect_that(round(as.vector(weta2p$beta), 4),
      # equals(c(0.5196, 0.6167, -0.6223,  0.4188,  0.3627,  0.2367, -0.3012,
              # -0.0942, -1.0861, 1.3403,  1.3276, -0.1584)))

  expect_that(dim(weta2p$real), equals(c(144, 3)))
  expect_that(colnames(weta2p$real),
    equals(c("est", "lowCI", "uppCI")))
  expect_that(round(as.vector(weta2p$real[1, ]), 4),
      equals(c(0.7594, 0.4800, 0.9277)))
  expect_that(round(as.vector(weta2p$real[4, ]), 4),
      equals(c(0.4810, 0.2815, 0.6855)))
  expect_that(round(as.vector(weta2p$real[73, ]), 4),
      equals(c(0.3493,  0.2507, 0.4592)))
  expect_that(round(AIC(weta2p), 4),
      equals(264.2643))

  weta3p <- occSScovSite(y, n, list(psi ~ Browsed, p ~ Browsed),
              data=weta.covs, link='p')

  expect_that(names(weta3p), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik")))
  expect_that(dim(weta3p$beta), equals(c(4, 4)))
  expect_that(colnames(weta3p$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta3p$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)", "p: BrowsedTRUE")))
  # expect_that(round(as.vector(weta3p$beta), 4),
      # equals(c( 0.5180,  0.6030, -0.6260,  0.0149,  0.4168,  0.4236,  0.2446,
                # 0.2446, -0.2989, -0.2273, -1.1054, -0.4645,  1.3349,  1.4333,
               # -0.1465,  0.4943)))
  expect_that(dim(weta3p$real), equals(c(144, 3)))
  expect_that(colnames(weta3p$real),
    equals(c("est", "lowCI", "uppCI")))
  expect_that(round(as.vector(weta3p$real[1, ]), 4),
      equals(c(0.7565, 0.4585, 0.9325)))
  expect_that(round(as.vector(weta3p$real[4, ]), 4),
      equals(c(0.4839, 0.2657, 0.7072)))
  expect_that(round(as.vector(weta3p$real[73, ]), 4),
      equals(c(0.3519, 0.2284, 0.4935)))
  expect_that(round(as.vector(weta3p$real[76, ]), 4),
      equals(c(0.3452, 0.1960, 0.5236)))
  expect_that(round(AIC(weta3p), 4),
      equals(266.2606))
})

