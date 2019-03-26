
# More test_that code for occSS series of functions

context("Single-season 2-species occupancy")

test_that("occ2sps gives right answers",  {
  require(wiqid)
  data(railSims)
  DHA <- railSims[, 1:3]
  DHB <- railSims[, 4:6]
  # Default model (no interaction)
  rail1 <- occ2sps(DHA, DHB)
  expect_equal(class(rail1), c("wiqid", "list"))
  expect_equal(names(rail1), c("call", "beta", "beta.vcv", "real", "logLik",
      "ci", "formulae", "index"))
  expect_true(is.call(rail1$call))

  expect_that(dim(rail1$beta), equals(c(8, 4)))
  expect_that(colnames(rail1$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(rail1$beta),
    equals(c("psiA", "psiBa", "psiBA", "pA", "pB", "rA", "rBa", "rBA")))
  expect_that(round(as.vector(rail1$beta), 4),
      equals(c(-0.1352,  0.4895,  0.4895,  1.3853,  0.9400,  1.3853,  0.9400,
      0.9400,  0.1598,  0.1687,  0.1687, 0.1758, 0.1419,  0.1758,  0.1419,
      0.1419, -0.4484,  0.1590,  0.1590,  1.0407,  0.6618, 1.0407,  0.6618,
      0.6618,  0.1780,  0.8201,  0.8201,  1.7299,  1.2181,  1.7299, 1.2181,  1.2181)))
  expect_that(dim(rail1$real), equals(c(8, 3)))
  expect_that(colnames(rail1$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(rail1$real[, 1]), 4),
      equals(c(0.4662, 0.6200, 0.6200, 0.7998, 0.7191, 0.7998, 0.7191, 0.7191)))
  expect_that(round(as.vector(rail1$real[, 2]), 4),
      equals(c(0.3897, 0.5397, 0.5397, 0.7390, 0.6597, 0.7390, 0.6597, 0.6597)))
  expect_that(round(as.vector(rail1$real[, 3]), 4),
      equals(c(0.5444, 0.6943, 0.6943, 0.8494, 0.7717, 0.8494, 0.7717, 0.7717)))
  expect_that(round(AIC(rail1), 4),
      equals(992.8706))

  # Model with full interaction (no covariates)
  rail2 <- occ2sps(DHA, DHB, list(psiBA ~ 1, rA ~ 1, rBa ~ 1, rBA ~ 1))
  # Check against PRESENCE results:
  expect_that(round(as.vector(rail2$real[, 1]), 4),
      equals(c(0.4673, 0.8077, 0.4591, 0.8513, 0.8118, 0.7353, 0.7100, 0.3566)))
  expect_that(round(as.vector(rail2$real[, 2]), 4),
      equals(c(0.3905, 0.7075, 0.3178, 0.7660, 0.7491, 0.6201, 0.4635, 0.2315)))
  expect_that(round(as.vector(rail2$real[, 3]), 4),
      equals(c(0.5457, 0.8794, 0.6073, 0.9091, 0.8617, 0.8254, 0.8740, 0.5049)))
  expect_that(round(AIC(rail2), 4),
      equals(928.6138))

  # Model matching data generation function
  rail3 <- occ2sps(DHA, DHB,
    model=list(psiA ~ logArea, psiBA ~ reeds, rBA ~ 1), data=railSims)
  expect_that(rownames(rail3$beta),
    equals(c("psiA:(Intercept)",  "psiA:logArea",      "psiBa:(Intercept)",
      "pA:(Intercept)",    "pB:(Intercept)",    "psiBA:(Intercept)",
      "psiBA:reedsTRUE",   "rBA:(Intercept)")))
  expect_that(round(as.vector(rail3$beta[, 1]), 4),
      equals(c(-0.1624,  1.4346,  1.4676,  1.3715,  1.4056, -0.8656,  1.8585, -0.7350)))
  expect_that(round(as.vector(rail3$beta[, 2]), 4),
      equals(c(0.1895, 0.2600, 0.2873, 0.1770, 0.1747, 0.4037, 0.7034, 0.3076)))
  expect_that(round(as.vector(rail3$beta[, 3]), 4),
      equals(c(-0.5339,  0.9250,  0.9046,  1.0245,  1.0632, -1.6569,  0.4798, -1.3378)))
  expect_that(round(as.vector(rail3$beta[, 4]), 4),
      equals(c(0.2090,  1.9442,  2.0306,  1.7185,  1.7480, -0.0743,  3.2373, -0.1321)))
  # Check a few real values against PRESENCE results:
  expect_that(round(as.vector(rail3$real[1:6, ]), 4),  # psiA
      equals(c(0.2686, 0.3790, 0.9052, 0.4924, 0.5150, 0.9240, 0.1853, 0.2922,
      0.7899, 0.4003, 0.4210, 0.8155, 0.3723, 0.4743, 0.9604, 0.5850, 0.6080, 0.9709)))
  expect_that(round(as.vector(rail3$real[161:162, ]), 4), # psiBa, all same
      equals(c(0.8127, 0.8127, 0.7119, 0.7119, 0.8840, 0.8840)))
  expect_that(round(as.vector(rail3$real[321:324, ]), 4), # psiBA, 2 values
      equals(c(0.7297, 0.2962, 0.2962, 0.7297, 0.4443, 0.1602, 0.1602, 0.4443,
        0.9011, 0.4814, 0.4814, 0.9011)))
  expect_that(round(as.vector(rail3$real[481:482, ]), 4), # pA, all same
      equals(c(0.7976, 0.7976, 0.7359, 0.7359, 0.8479, 0.8479)))
  expect_that(round(as.vector(rail3$real[641:642, ]), 4), # pB, all same
      equals(c(0.8031, 0.8031, 0.7433, 0.7433, 0.8517, 0.8517)))
  expect_that(round(as.vector(rail3$real[801:802, ]), 4), # rA == pA
      equals(round(as.vector(rail3$real[481:482, ]), 4)))
  expect_that(round(as.vector(rail3$real[961:962, ]), 4), # rBa == pB
      equals(round(as.vector(rail3$real[641:642, ]), 4)))
  expect_that(round(as.vector(rail3$real[1121:1122, ]), 4), # rBA, all same
      equals(c(0.3241, 0.3241, 0.2079, 0.2079, 0.4670, 0.4670)))
  expect_that(round(AIC(rail3), 4),
      equals(874.3069))

})


