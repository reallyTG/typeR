# File created 2017-05-23

# test_that code for predict methods

# predict is implemented for occMS and occMS0

# not implemented for occMStime, occMScovSite.

context("Predict method for occMS")

test_that("Predict works for occMS",  {
  require(wiqid)
  data(GrandSkinks)
  DH <- GrandSkinks[, 1:15]
  newdata <- expand.grid(habitat = c("Natural","Pasture"), nons=c(-1,0,1))
  rownames(newdata) <- outer(c("Natural","Pasture"), c("S", "M", "L"), paste, sep=":")

  res0 <- occMS(DH, 3)  # This invokes occMS0
  expect_message(pred0 <- predict(res0, newdata, "gamma"),
    "This is an intercept-only model")
  expect_equal(attr(pred0, "link"), "logit")
  expect_equal(rownames(pred0), rownames(newdata))
  expect_equal(colnames(pred0), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(pred0), 4), c(-2.6133,  0.1865, -2.9788, -2.2478))

  res1 <- occMS(DH, 3, list(psi1 ~ habitat, gamma ~ habitat), data=GrandSkinks)
  # On logit scale:
  pred1 <- predict(res1, newdata, "gamma")
  expect_equivalent(round(colMeans(pred1), 4), c(-2.6618,  0.2714, -3.1938, -2.1298))
  expect_equal(pred1[1, ], pred1[3, ])
  # On probability scale
  pred1p <- predict(res1, newdata, "gamma", type="response")
  expect_equivalent(round(colMeans(pred1p), 4), c(0.0722, 0.0167, 0.0457, 0.1129))
  expect_equal(pred1p[1, ], pred1p[3, ])

  expect_message(pred1a <- predict(res1, newdata, "epsilon"),
     "This is an intercept-only model")
  expect_equivalent(colMeans(pred1a), res1$beta['eps: (Intercept)', ])
  expect_true(all(diff(pred1a[, 1]) == 0))

  newdata2 <- expand.grid(habitat = c("Natural","Pasture"), .interval = factor(1:4))
  rownames(newdata2) <- outer(c("Natural","Pasture"), 1:4, paste, sep=":")

  res2 <- occMS(DH, 3, gamma ~ .interval) # invokes occMStime, not yet implemented
  expect_error(pred2 <- predict(res2, newdata, "gamma"),
    "No coefficients found for parameter")

  res3 <- occMS(DH, 3, gamma ~ .interval, data=GrandSkinks)
  # On logit scale:
  pred3 <- predict(res3, newdata2, "gamma")
  expect_equal(pred3[1, ], pred3[2, ])  # habitat has no effect
  expect_equivalent(round(colMeans(pred3), 4), c(-2.7367,  0.5140, -3.7441, -1.7292))
  # On probability scale:
  pred3p <- predict(res3, newdata2, "gamma", type="response")
  expect_equivalent(round(colMeans(pred3p), 4), c(0.0711, 0.0259, 0.0357, 0.1524))

  expect_message(pred3a <- predict(res3, newdata2, "epsilon"),
     "This is an intercept-only model")
  expect_equivalent(colMeans(pred3a), res3$beta['eps: (Intercept)', ])
  expect_true(all(diff(pred3a[, 1]) == 0))

  res4 <- occMS(DH, 3, gamma ~ habitat + .interval, data=GrandSkinks)
  # On logit scale:
  pred4 <- predict(res4, newdata2, "gamma")
  expect_equivalent(round(colMeans(pred4), 4), c(-2.8603,  0.5871, -4.0110, -1.7097))
  expect_false(any(diff(pred4[, 1]) == 0))  # all different
  # On probability scale:
  pred4p <- predict(res4, newdata2, "gamma", type="response")
  expect_equivalent(round(colMeans(pred4p), 4), c(0.0761, 0.0290, 0.0370, 0.1700))

  expect_message(pred4a <- predict(res3, newdata2, "p"),
     "This is an intercept-only model")
  expect_equivalent(colMeans(pred4a), res3$beta['p: (Intercept)', ])
  expect_true(all(diff(pred3a[, 1]) == 0))

  newdata3 <- expand.grid(habitat = c("Natural","Pasture"), .season = factor(1:5))
  rownames(newdata3) <- outer(c("Natural","Pasture"), 1:5, paste, sep=":")

  res5 <- occMS(DH, 3, p ~ habitat + .season, data=GrandSkinks)
  # On logit scale:
  pred5 <- predict(res5, newdata3, "p")
  expect_equivalent(round(colMeans(pred5), 4), c(0.7060, 0.2679, 0.1810, 1.2311))
  expect_false(any(diff(pred5[, 1]) == 0))  # all different
  # On probability scale:
  pred5p <- predict(res5, newdata3, "p", type="response")
  expect_equivalent(round(colMeans(pred5p), 4), c(0.6643, 0.0579, 0.5434, 0.7668))

  expect_message(pred5a <- predict(res5, newdata3, "psi1"),
     "This is an intercept-only model")
  expect_equivalent(colMeans(pred5a), res5$beta['psi1: (Intercept)', ])
  expect_true(all(diff(pred5a[, 1]) == 0))
})
# ..............................................................

test_that("Predict works for occMS0",  {
  require(wiqid)
  data(GrandSkinks)
  DH <- GrandSkinks[, 1:15]
  res0 <- occMS0(DH, 3)
  newdata <- expand.grid(habitat = c("Natural","Pasture"), nons=c(-1,0,1))
  rownames(newdata) <- outer(c("Natural","Pasture"), c("S", "M", "L"), paste, sep=":")

  # logit scale
  expect_message(pred0 <- predict(res0, newdata, "gamma"),
    "This is an intercept-only model")
  expect_equal(attr(pred0, "link"), "logit")
  expect_equal(rownames(pred0), rownames(newdata))
  expect_equal(colnames(pred0), c("est", "SE", "lowCI", "uppCI"))
  expect_true(all(diff(pred0[, 1]) == 0))
  expect_equivalent(round(colMeans(pred0), 4), c(-2.6133,  0.1865, -2.9788, -2.2478))

  # probability scale
  expect_message(pred0p <- predict(res0, newdata, "gamma", type="response"),
    "This is an intercept-only model")
  expect_equal(attr(pred0p, "link"), "logit")
  expect_equal(rownames(pred0p), rownames(newdata))
  expect_equal(colnames(pred0p), c("est", "SE", "lowCI", "uppCI"))
  expect_true(all(diff(pred0p[, 1]) == 0))
  expect_equivalent(round(colMeans(pred0p), 4), c(0.0683, 0.0119, 0.0484, 0.0955))
})
# ..............................................................

