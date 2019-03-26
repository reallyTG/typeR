# This file split from "test-occSS.R" 2015-02-20

# More test_that code for occSS series of functions

context("Single-season occupancy, site and survey covars")

test_that("occSS with logit link",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  weta.covs <- weta[, 6:11]
  # Check dots passed to nlm
  expect_warning(occSS(DH, iterlim=4),
      "Convergence may not have been reached")
  weta4 <- occSS(DH)  # This should call occSS0
  expect_that(class(weta4), equals(c("wiqid", "list")))
  expect_that(names(weta4), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik","ci", "formulae", "index")))
  expect_that(is.call(weta4$call), is_true())
  expect_that(dim(weta4$beta), equals(c(2, 4)))
  expect_that(colnames(weta4$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta4$beta),
    equals(c("psiHat", "pHat")))
  expect_that(round(as.vector(weta4$beta), 4),
      equals(c(0.4751, -0.6218,  0.3746,  0.2364, -0.2590, -1.0851,  1.2093, -0.1585)))

  expect_that(dim(weta4$real), equals(c(2, 3)))
  expect_that(colnames(weta4$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(weta4$real[, 1]), 4),
      equals(c(0.6166, 0.3494)))
  expect_that(round(as.vector(weta4$real[, -1]), 4),
      equals(c(0.4356, 0.2525, 0.7702, 0.4604)))
  expect_that(round(AIC(weta4), 4),
      equals(265.7872))
  weta4a <- occSS(DH, ci=0.85)
  expect_that(round(as.vector(weta4a$real[1, ]), 4),
      equals(c(0.6166, 0.4840, 0.7339)))
  expect_that(round(as.vector(weta4a$real[2, ]), 4),
      equals(c(0.3494, 0.2765, 0.4301)))

  # Check dots passed to nlm
  expect_warning(occSS(DH, psi ~ Browsed, data=weta.covs, iterlim=5),
      "Convergence may not have been reached")

  weta5 <- occSS(DH, psi ~ Browsed, data=weta.covs)
  expect_that(names(weta5), equals(
    c("call", "link", "beta", "beta.vcv", "real", "logLik", "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(dim(weta5$beta), equals(c(3, 4)))
  expect_that(colnames(weta5$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta5$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)")))
  # Standardisation changed; leave this out for now
  # expect_that(round(as.vector(weta5$beta), 4),
      # equals(c( 0.5196,  0.6167, -0.6223,  0.4188,  0.3627,  0.2367, -0.3012,
               # -0.0942, -1.0861,  1.3403,  1.3276, -0.1584)))
  expect_that(dim(weta5$real), equals(c(334, 3)))
  expect_that(colnames(weta5$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(weta5$real[1, ]), 4),
      equals(c(0.7594, 0.4660, 0.9194)))
  expect_that(round(as.vector(weta5$real[4, ]), 4),
      equals(c(0.4810, 0.2843, 0.6837)))
  expect_that(round(as.vector(weta5$real[73, ]), 4),
      equals(c(0.3493,  0.2524, 0.4605)))
  expect_that(round(as.vector(weta5$real[334, ]), 4),
      equals(c(0.3493,  0.2524, 0.4605)))
  expect_that(round(AIC(weta5), 4),
      equals(264.2643))

  weta6 <- occSS(DH, list(psi ~ Browsed, p ~ ObsD), data=weta.covs)
  expect_that(names(weta6), equals( c("call", "link", "beta", "beta.vcv", "real", "logLik", "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(dim(weta6$beta), equals(c(5, 4)))
  expect_that(colnames(weta6$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta6$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)",
             "p: ObsDB",  "p: ObsDC")))
  # Standardisation changed; leave this out for now
  # expect_that(round(as.vector(weta6$beta), 4),
      # equals(c( 0.5119,  0.5935, -1.2453,  0.7498,  1.0294,  0.4061,  0.3532,
                # 0.3615,  0.4427,  0.4324, -0.2841, -0.0988, -1.9537, -0.1179,
                # 0.1819,  1.3079,  1.2858, -0.5368,  1.6175,  1.8770)))
  expect_that(dim(weta6$real), equals(c(334, 3)))
  expect_that(colnames(weta6$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(weta6$real[1, ]), 4),
      equals(c(0.7536, 0.4723, 0.9127)))
  expect_that(round(as.vector(weta6$real[4, ]), 4),
      equals(c(0.4847, 0.2865, 0.6877)))
  expect_that(round(as.vector(weta6$real[73, ]), 4),
      equals(c(0.2235, 0.1241, 0.3689))) # PRESENCE 2nd value is 0.1242
  expect_that(round(as.vector(weta6$real[94, ]), 4),
      equals(c(0.3786, 0.2383, 0.5426)))
  expect_that(round(as.vector(weta6$real[334, ]), 4),
      equals(c(0.4462, 0.2980, 0.6047)))
  expect_that(round(AIC(weta6), 4),
      equals(262.0421))
})
# ..............................................................

test_that("occSS with probit link",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  weta.covs <- weta[, 6:11]

  weta4p <- occSS(DH, link="probit")
  expect_that(class(weta4p), equals(c("wiqid", "list")))
  expect_that(names(weta4p), equals(c("call", "link", "beta", "beta.vcv", "real", "logLik",
    "ci", "formulae", "index")))
  expect_that(is.call(weta4p$call), is_true())
  expect_that(dim(weta4p$beta), equals(c(2, 4)))
  expect_that(colnames(weta4p$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta4p$beta),
    equals(c("psiHat", "pHat")))
  expect_that(round(as.vector(weta4p$beta), 4),
      equals(c( 0.2966, -0.3870,  0.2319,  0.1452,
               -0.1581, -0.6716,  0.7512, -0.1025)))

  expect_that(dim(weta4p$real), equals(c(2, 3)))
  expect_that(colnames(weta4p$real),
    equals(c("est", "lowCI", "uppCI")))
 expect_that(round(as.vector(weta4p$real[, 1]), 4),
      equals(c(0.6166, 0.3494))) # estimate same
  expect_that(round(as.vector(weta4p$real[, -1]), 4),
      equals(c(0.4372, 0.2509, 0.7737, 0.4592))) # CIs differ
  expect_that(round(AIC(weta4p), 4),
      equals(265.7872)) # different

  weta5p <- occSS(DH, psi ~ Browsed, data=weta.covs, link="p")
  expect_that(names(weta5p), equals( c("call", "link", "beta", "beta.vcv", "real", "logLik", "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(dim(weta5p$beta), equals(c(3, 4)))
  expect_that(colnames(weta5p$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta5p$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)")))
  # Standardisation changed; leave this out for now
  # expect_that(round(as.vector(weta5p$beta), 4),
      # equals(c( 0.5196,  0.6167, -0.6223,  0.4188,  0.3627,  0.2367, -0.3012,
               # -0.0942, -1.0861,  1.3403,  1.3276, -0.1584)))
  expect_that(dim(weta5p$real), equals(c(334, 3)))
  expect_that(colnames(weta5p$real),
    equals(c("est", "lowCI", "uppCI")))
  expect_that(round(as.vector(weta5p$real[1, ]), 4),
      equals(c(0.7594, 0.4800, 0.9277)))
  expect_that(round(as.vector(weta5p$real[4, ]), 4),
      equals(c(0.4810, 0.2815, 0.6855)))
  expect_that(round(as.vector(weta5p$real[73, ]), 4),
      equals(c(0.3493,  0.2507, 0.4592)))
  expect_that(round(as.vector(weta5p$real[334, ]), 4),
      equals(c(0.3493,  0.2507, 0.4592)))
  expect_that(round(AIC(weta5p), 4),
      equals(264.2643))

  weta6p <- occSS(DH, list(psi ~ Browsed, p ~ ObsD), data=weta.covs, link='p')
  expect_that(names(weta6p), equals( c("call", "link", "beta", "beta.vcv", "real", "logLik", "ci", "formulae", "index", "xlev", "scaling")))
  expect_that(dim(weta6p$beta), equals(c(5, 4)))
  expect_that(colnames(weta6p$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(weta6p$beta),
    equals(c("psi: (Intercept)", "psi: BrowsedTRUE", "p: (Intercept)",
             "p: ObsDB",  "p: ObsDC")))
  # Standardisation changed; leave this out for now
  # expect_that(round(as.vector(weta6p$beta), 4),
      # equals(c( 0.5119,  0.5935, -1.2453,  0.7498,  1.0294,  0.4061,  0.3532,
                # 0.3615,  0.4427,  0.4324, -0.2841, -0.0988, -1.9537, -0.1179,
                # 0.1819,  1.3079,  1.2858, -0.5368,  1.6175,  1.8770)))
  expect_that(dim(weta6p$real), equals(c(334, 3)))
  expect_that(colnames(weta6p$real),
    equals(c("est", "lowCI", "uppCI")))
  expect_that(round(as.vector(weta6p$real[1, ]), 4),
      equals(c(0.7536, 0.4849, 0.9207)))
  expect_that(round(as.vector(weta6p$real[4, ]), 4),
      equals(c(0.4847, 0.2838, 0.6896)))
  expect_that(round(as.vector(weta6p$real[73, ]), 4),
      equals(c(0.2235, 0.1206, 0.3636)))
  expect_that(round(as.vector(weta6p$real[94, ]), 4),
      equals(c(0.3786, 0.2353, 0.5411)))
  expect_that(round(as.vector(weta6p$real[334, ]), 4),
      equals(c(0.4462, 0.2960, 0.6047)))
  expect_that(round(AIC(weta6p), 4),
      equals(262.0421))
})

