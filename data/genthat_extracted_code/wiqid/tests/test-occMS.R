
# More test_that code for occSS series of functions

# library(testthat)

context("Multi-season occupancy")

test_that("occMS0 gives right answers",  {
  require(wiqid)
  data(GrandSkinks)
  DH <- GrandSkinks[, 1:15]
  res1 <- occMS0(DH, 3)

  expect_that(class(res1), equals(c("wiqid", "list")))
  expect_that(names(res1),
    equals(c("call", "beta", "beta.vcv", "real", "logLik", "ci", "link", "index")))
  expect_that(is.call(res1$call), is_true())

  expect_that(dim(res1$beta), equals(c(4, 4)))
  expect_that(colnames(res1$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(res1$beta),
    equals(c("psi1", "gamma", "epsilon", "p")))
  expect_that(round(as.vector(res1$beta), 4),
      equals(c(-0.4284, -2.6133, -2.1971,  0.7962,  0.1318,  0.1865,  0.2029,
        0.1077, -0.6868, -2.9788, -2.5947,  0.5850, -0.1701, -2.2478,
        -1.7995,  1.0073)))

  expect_that(dim(res1$real), equals(c(4, 3)))
  expect_that(colnames(res1$real),
    equals(c("est", "lowCI", "uppCI")))

  # Check against PRESENCE results:
  expect_that(round(as.vector(res1$real), 4),
      equals(c(0.3945, 0.0683, 0.1, 0.6892, 0.3348, 0.0484, 0.0695,
        0.6422, 0.4576, 0.0955, 0.1419, 0.7325)))
  expect_that(round(AIC(res1), 4),
      equals(1775.0155))

  res1a <- occMS0(DH, 3, ci=0.85)
  expect_that(round(as.vector(res1a$real), 4),
      equals(c(0.3945, 0.0683, 0.1, 0.6892, 0.3502, 0.0531, 0.0766,
        0.655, 0.4406, 0.0875, 0.1295, 0.7214)))
})

test_that("occMStime gives right answers",  {
  require(wiqid)
  data(GrandSkinks)
  DH <- GrandSkinks[, 1:15]
  res1 <- occMStime(DH, 3)

  expect_that(class(res1), equals(c("wiqid", "list")))
  expect_that(names(res1),
    equals(c("call", "beta", "beta.vcv", "real", "logLik")))
  expect_that(is.call(res1$call), is_true())

  expect_that(dim(res1$beta), equals(c(4, 4)))
  expect_that(colnames(res1$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(res1$beta),
    equals(c("psi1", "gam: (Intercept)", "eps: (Intercept)", "p: (Intercept)" )))
  expect_that(round(as.vector(res1$beta), 4),
      equals(c(-0.4284, -2.6133, -2.1971,  0.7962,  0.1318,  0.1865,  0.2029,
        0.1077, -0.6868, -2.9788, -2.5947,  0.5850, -0.1701, -2.2478,
        -1.7995,  1.0073)))

  expect_that(dim(res1$real), equals(c(14, 3)))
  expect_that(colnames(res1$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(round(as.vector(res1$real[1, ]), 4),
      equals(c(0.3945, 0.3348, 0.4576)))
  expect_that(round(as.vector(res1$real[3, ]), 4),
      equals(c(0.0683, 0.0484, 0.0955)))
  expect_that(round(as.vector(res1$real[8, ]), 4),
      equals(c(0.1, 0.0695, 0.1419)))
  expect_that(round(as.vector(res1$real[14, ]), 4),
      equals(c(0.6892, 0.6422, 0.7325)))
  expect_that(round(AIC(res1), 4),
      equals(1775.0155))
  res2 <- occMStime(DH, 3, list(gamma ~ .interval, epsilon~.interval, p~.season))
  expect_that(dim(res2$beta), equals(c(14, 4)))
  expect_that(dim(res2$real), equals(c(14, 3)))
  # Check against PRESENCE results:
  expect_that(round(as.vector(res2$real), 4),
      equals(c( 0.3834, 0.1176, 0.0135, 0.0706, 0.0958,
                  0.0704, 0.0730, 0.1388, 0.1703,
                  0.6950, 0.6506, 0.6888, 0.8424, 0.6643,
                0.3191, 0.0611, 0.0008, 0.0362, 0.0531,
                  0.0302, 0.0318, 0.0766, 0.0836,
                  0.5730, 0.5602, 0.6032, 0.7403, 0.5403,
                0.4520, 0.2147, 0.1854, 0.1329, 0.1667,
                  0.1557, 0.1586, 0.2384, 0.3158,
                  0.7946, 0.7313, 0.7632, 0.9092, 0.7692)))
    # Same as PRESENCE +/- 0.0001
  expect_that(round(AIC(res2), 4),
      equals(1773.8787)) # Same as PRESENCE
})


test_that("occMS gives right answers",  {
  require(wiqid)
  data(GrandSkinks)
  DH <- GrandSkinks[, 1:15]

  if(TRUE)  {  # Don't do this regularly, too slow
    res1 <- occMS(DH, 3)  # this invokes occMS0
    expect_that(class(res1), equals(c("wiqid", "list")))
    expect_that(names(res1),
      equals(c("call", "beta", "beta.vcv", "real", "logLik", "ci", "link", "index")))
    expect_that(is.call(res1$call), is_true())

    expect_that(dim(res1$beta), equals(c(4, 4)))
    expect_that(colnames(res1$beta),
      equals(c("est", "SE",  "lowCI", "uppCI")))
    expect_that(rownames(res1$beta),
      equals(c("psi1", "gamma", "epsilon", "p" )))
      # equals(c("psi1: (Intercept)", "gam: (Intercept)", "eps: (Intercept)", "p: (Intercept)" )))
    expect_that(round(as.vector(res1$beta), 4),
        equals(c(-0.4284, -2.6133, -2.1971,  0.7962,  0.1318,  0.1865,  0.2029,
          0.1077, -0.6868, -2.9788, -2.5947,  0.5850, -0.1701, -2.2478,
          -1.7995,  1.0073)))
    expect_that(dim(res1$real), equals(c(4, 3)))
    expect_that(colnames(res1$real),
      equals(c("est", "lowCI", "uppCI")))
    # Check against PRESENCE results:
    expect_that(as.vector(t(round(unique(res1$real), 4))),
        equals(c(0.3945, 0.3348, 0.4576,
          0.0683, 0.0484, 0.0955,
          0.1000, 0.0695, 0.1419,
          0.6892, 0.6422, 0.7325)))
    expect_that(round(AIC(res1), 4),
        equals(1775.0155))
  }  # if FALSE

  res2 <- occMS(DH, 3,
     model=list(psi1~habitat, gamma ~ habitat, epsilon~habitat),
     data=GrandSkinks)
  expect_that(dim(res2$beta), equals(c(7, 4)))
  expect_that(dim(res2$real), equals(c(5353, 3)))
  # Check against PRESENCE results:
    expect_that(as.vector(t(round(unique(res2$real), 4))),
        equals(c(0.2315, 0.1601, 0.3224,
          0.5075, 0.4239, 0.5906,
          0.0434, 0.0242, 0.0769,
          0.1004, 0.0663, 0.1491,
          0.1557, 0.0914, 0.2527,
          0.0844, 0.0523, 0.1335,
          0.6882, 0.6412, 0.7316)))
    # Same as PRESENCE +/- 0.0001
    expect_that(round(AIC(res2), 4),
        equals(1745.0000))
})


test_that("occMScovSite gives right answers",  {
  require(wiqid)
  data(GrandSkinks)
  DH <- GrandSkinks[, 1:15]

  res1 <- occMScovSite(DH, 3)
  expect_that(class(res1), equals(c("wiqid", "list")))
  expect_that(names(res1),
    equals(c("call", "beta", "beta.vcv", "real", "logLik", "ci")))
  expect_that(is.call(res1$call), is_true())

  expect_that(dim(res1$beta), equals(c(4, 4)))
  expect_that(colnames(res1$beta),
    equals(c("est", "SE",  "lowCI", "uppCI")))
  expect_that(rownames(res1$beta),
    # equals(c("ps1: (Intercept)", "gam: (Intercept)", "eps: (Intercept)", "p: (Intercept)" )))
    equals(c("psi1: (Intercept)", "gam: (Intercept)", "eps: (Intercept)", "p: (Intercept)" )))
  expect_that(round(as.vector(res1$beta), 4),
      equals(c(-0.4284, -2.6133, -2.1971,  0.7962,  0.1318,  0.1865,  0.2029,
        0.1077, -0.6868, -2.9788, -2.5947,  0.5850, -0.1701, -2.2478,
        -1.7995,  1.0073)))
  expect_that(dim(res1$real), equals(c(4732, 3)))
  expect_that(colnames(res1$real),
    equals(c("est", "lowCI", "uppCI")))
  # Check against PRESENCE results:
  expect_that(as.vector(t(round(unique(res1$real), 4))),
      equals(c(0.3945, 0.3348, 0.4576,
        0.0683, 0.0484, 0.0955,
        0.1000, 0.0695, 0.1419,
        0.6892, 0.6422, 0.7325)))
  expect_that(round(AIC(res1), 4),
      equals(1775.0155))

  res2 <- occMScovSite(DH, 3,
     model=list(psi1~habitat, gamma ~ habitat, epsilon~habitat),
     data=GrandSkinks)
  expect_that(dim(res2$beta), equals(c(7, 4)))
  expect_that(dim(res2$real), equals(c(4732, 3)))
  # Check against PRESENCE results:
    expect_that(as.vector(t(round(unique(res2$real), 4))),
        equals(c(0.2315, 0.1601, 0.3224,
          0.5075, 0.4239, 0.5906,
          0.0434, 0.0242, 0.0769,
          0.1004, 0.0663, 0.1491,
          0.1557, 0.0914, 0.2527,
          0.0844, 0.0523, 0.1335,
          0.6882, 0.6412, 0.7316)))
    # Same as PRESENCE +/- 0.0001
    expect_that(round(AIC(res2), 4),
        equals(1745.0000))
})


