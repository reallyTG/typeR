# File created 2017-05-23

# test_that code for predict methods
# occSSrn now has own file

# predict is implemented for occSS, occSS0

# not implemented for occSScovsite, occSStime

context("Predict method for occSS*")

test_that("Predict works for occSS",  {
  # Data set (weta)
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  weta.covs <- weta[, 6:11]
  set.seed(123)
  weta.covs$nons <- rnorm(nrow(weta))

  newdata <- expand.grid(Browsed=c(TRUE, FALSE), nons=c(-1,0,1))
  wetaBn <- occSS(DH, psi ~ Browsed + nons, data=weta.covs)
  # On logit scale:
  predBn <- predict(wetaBn, newdata, "psi")
  expect_equal(attr(predBn, "link"), "logit")
  expect_equal(nrow(predBn), nrow(newdata))
  expect_equal(rownames(predBn), rownames(newdata))
  expect_equal(colnames(predBn), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBn), 4), c(0.5529, 0.6154, -0.6532, 1.7590))
  # With different CI
  predBn80 <- predict(wetaBn, newdata, "psi", ci=0.8)
  expect_equivalent(round(colMeans(predBn80), 4), c(0.5529, 0.6154, -0.2357, 1.3415))
  # On probability scale
  predBn <- predict(wetaBn, newdata, "psi", type="response")
  expect_equal(nrow(predBn), nrow(newdata))
  expect_equal(colnames(predBn), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBn), 4), c(0.6228, 0.1278, 0.3491, 0.8217))

  wetaB <- occSS(DH, psi ~ Browsed, data=weta.covs)
  predB <- predict(wetaB, newdata, "psi", type="response")
  expect_equivalent(round(colMeans(predB), 4), c(0.6202, 0.1139, 0.3752, 0.8016))
  expect_equal(predB[1, ], predB[3,])

  weta0 <- occSS(DH)  # This should call occSS0
  expect_message(pred0 <- predict(weta0, newdata, "psi", type="response"),
    "This is an intercept-only model")
  expect_equal(nrow(pred0), nrow(newdata))
  expect_equivalent(round(colMeans(pred0), 4), c(0.6166, 0.0885, 0.4356, 0.7702 ))
  expect_equal(pred0[1, ], pred0[2,])

  newdata <- data.frame(ObsD = c("A", "B", "C"))
  wetaBnO <- occSS(DH, list(psi ~ Browsed + nons, p ~ ObsD), data=weta.covs)
  predBnO <- predict(wetaBnO, newdata, "p", type="response")
  expect_equal(nrow(predBnO), nrow(newdata))
  expect_equal(colnames(predBnO), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBnO), 4), c(0.3488, 0.0744, 0.2198, 0.5046))

  newdata1 <- data.frame(ObsD = c("B", "C"))
  predBnO1 <- predict(wetaBnO, newdata1, "p", type="response")
  expect_equal(nrow(predBnO1), nrow(newdata1))
  expect_equal(colnames(predBnO1), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBnO1), 4), c(0.4120, 0.0803, 0.2679, 0.5732))

  # Check error messages
  newdata <- data.frame(Browsed=c(TRUE, FALSE))
  expect_error(predict(wetaBn, newdata, "psi"),
    "Needed variable")
  expect_error(predict(wetaBn, newdata, "whatever"),
    "No coefficients found for parameter")
  newdata2 <- data.frame(ObsD = c("B", "C", "X"))
  expect_error(predict(wetaBnO, newdata2, "p"),
    "factor ObsD has new levels X")

  # With probit link
  newdata <- expand.grid(Browsed=c(TRUE, FALSE), nons=c(-1,0,1))
  wetaBn <- occSS(DH, psi ~ Browsed + nons, data=weta.covs, link="probit")
  # On probit scale:
  predBn <- predict(wetaBn, newdata, "psi")
  expect_equal(attr(predBn, "link"), "probit")
  expect_equal(nrow(predBn), nrow(newdata))
  expect_equal(colnames(predBn), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBn), 4), c(0.3375,  0.3712, -0.3900,  1.0650))
  # On probability scale
  predBn <- predict(wetaBn, newdata, "psi", type="response")
  expect_equal(nrow(predBn), nrow(newdata))
  expect_equal(colnames(predBn), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBn), 4), c(0.6227, 0.1281, 0.3543, 0.8274))

  # With .time and .Time covars
  # ---------------------------
  wetaBt <- occSS(DH, p ~ Browsed + .time, data=weta.covs)
  newdata2 <- expand.grid(Browsed=c(TRUE, FALSE), .time=factor(1:5))
  rownames(newdata2) <- outer(c(TRUE, FALSE), 1:5, paste, sep=":")
  # On logit scale:
  predBt <- predict(wetaBt, newdata2, "p")
  expect_equal(attr(predBt, "link"), "logit")
  expect_equal(rownames(predBt), rownames(newdata2))
  expect_equal(colnames(predBt), c("est", "SE", "lowCI", "uppCI"))
  expect_equivalent(round(colMeans(predBt), 4), c(-0.8012,  0.4842, -1.7503,  0.1479))
  # On probability scale:
  predBtp <- predict(wetaBt, newdata2, "p", type="response")
  expect_equivalent(round(colMeans(predBtp), 4), c(0.3252, 0.0949, 0.1708, 0.5313))

  wetaBT <- occSS(DH, p ~ Browsed + .Time, data=weta.covs)
  newdata3 <- expand.grid(.Time=1:5, Browsed=c(TRUE, FALSE))
  rownames(newdata3) <- outer(1:5, c(TRUE, FALSE), paste, sep=":")
  # On logit scale:
  predBT <- predict(wetaBT, newdata3, "p")
  expect_equal(rownames(predBT), rownames(newdata3))
  expect_equivalent(round(colMeans(predBT), 4), c(-0.7944,  0.3628, -1.5055, -0.0834))
  # On probability scale:
  predBTp <- predict(wetaBT, newdata3, "p", type="response")
  expect_equivalent(round(colMeans(predBTp), 4), c(0.3183, 0.0745, 0.1932, 0.4794))
})
# ..............................................................

test_that("Predict works for occSS0",  {
  # Data set (weta)
  require(wiqid)
  data(salamanders)
  n <- rowSums(!is.na(salamanders))
  y <- rowSums(salamanders > 0, na.rm=TRUE)
  brs1 <- occSS0(y, n)

  newdata <- data.frame(factor(1:3))
  rownames(newdata) <- LETTERS[1:3]
  # logit scale
  expect_message(pred1 <- predict(brs1, newdata, "psi"),
    "This is an intercept-only model")
  expect_equal(attr(pred1, "link"), "logit")
  expect_equal(rownames(pred1), rownames(newdata))
  expect_equivalent(colMeans(pred1), brs1$beta["psiHat", ])
  expect_true(all(diff(pred1[, 1]) == 0))
  # probability scale
  expect_message(pred1p <- predict(brs1, newdata, "p", type="response"),
    "This is an intercept-only model")
  expect_equal(attr(pred1p, "link"), "logit")
  expect_equal(rownames(pred1p), rownames(newdata))
  expect_equivalent(colMeans(pred1p)[-2], brs1$real["pHat", ])
  expect_true(all(diff(pred1p[, 1]) == 0))

  brs2 <- occSS0(y, n, link="probit")

  # probit scale
  expect_message(pred2 <- predict(brs2, newdata, "psi"),
    "This is an intercept-only model")
  expect_equal(attr(pred2, "link"), "probit")
  expect_equal(rownames(pred2), rownames(newdata))
  expect_equivalent(colMeans(pred2), brs2$beta["psiHat", ])
  expect_true(all(diff(pred2[, 1]) == 0))
  # probability scale
  expect_message(pred2p <- predict(brs2, newdata, "p", type="response"),
    "This is an intercept-only model")
  expect_equal(attr(pred2p, "link"), "probit")
  expect_equal(rownames(pred2p), rownames(newdata))
  expect_equivalent(colMeans(pred2p)[-2], brs2$real["pHat", ])
  expect_true(all(diff(pred2p[, 1]) == 0))

})
# ..............................................................

test_that("Predict DOESN'T work for occSScovSite",  {
  require(wiqid)
  data(weta)
  DH <- weta[, 1:5]
  y <- rowSums(DH, na.rm=TRUE)
  n <- rowSums(!is.na(DH))
  weta.covs <- weta[, 6, drop=FALSE]
  weta.covs$nons <- rnorm(nrow(weta))

  newdata <- expand.grid(Browsed=c(TRUE, FALSE), nons=c(-1,0,1), KEEP.OUT.ATTRS = FALSE)

  weta1 <- occSScovSite(y, n)
  expect_error(pred1 <- predict(weta1, newdata, "psi"),
      "No coefficients found")
})
# ..............................................................

test_that("Predict DOESN'T work for occSStime",  {
  require(wiqid)
  data(salamanders)
  BRS <- salamanders

  res0 <- occSStime(BRS, plot=FALSE)
  newdata <- data.frame(.time = factor(1:5))
  expect_error(pred0 <- predict(res0, newdata, 'p'),
      "No coefficients found")
})
# ..............................................................
