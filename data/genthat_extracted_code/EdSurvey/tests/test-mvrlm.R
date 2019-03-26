require(testthat)
require(EdSurvey)
options(width = 500)
options(useFancyQuotes=FALSE)

context("Multivariate Regression")

sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

context("Multivariate Regression: 2 DVs (2 non PV)")
test_that("mvrlm.sdf results align with lm.sdf", {
  skip_on_cran()
  mvrlm.fit <- mvrlm.sdf(mrps51 | mrps22 ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.mrps51 <- lm.sdf(mrps51 ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.mrps22 <- lm.sdf(mrps22 ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  # compare coefficient tables
  expect_equal(mvrlm.fit$coefmat$mrps51, lm.fit.mrps51$coefmat)
  expect_equal(mvrlm.fit$coefmat$mrps22, lm.fit.mrps22$coefmat)
  
  # compare residuals
  expect_equal(as.vector(mvrlm.fit$residuals[,1]), as.vector(lm.fit.mrps51$residuals))
  expect_equal(as.vector(mvrlm.fit$residuals[,2]), as.vector(lm.fit.mrps22$residuals))
  
  # compare residual covariance
  mrps51 <- lm.fit.mrps51$residuals
  mrps22 <- lm.fit.mrps22$residuals
  ee <- cbind(mrps51, mrps22)
  lmResidCov <- t(ee) %*% ee
  expect_equivalent(mvrlm.fit$residCov, lmResidCov)
})

context("Multivariate Regression: 2 DVs (1 PV 1 non PV)")
test_that("mvrlm.sdf results align with lm.sdf", {
  skip_on_cran()
  mvrlm.fit <- mvrlm.sdf(composite | mrps22 ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.comp <- lm.sdf(composite ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.mrps22 <- lm.sdf(mrps22 ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  
  # compare coefficient tables
  expect_equal(mvrlm.fit$coefmat$composite, lm.fit.comp$coefmat)
  expect_equal(mvrlm.fit$coefmat$mrps22, lm.fit.mrps22$coefmat)
  
  # compare residuals
  dimnames(lm.fit.comp$PV.residuals)[[2]] <-  c("mrpcm1", "mrpcm2", "mrpcm3", "mrpcm4", "mrpcm5")
  mvrResid <- as.matrix(mvrlm.fit$residPV[[1]])
  lmResid <- lm.fit.comp$PV.residuals
  expect_equal(mvrResid, lmResid)
  mvrResid <- as.vector(mvrlm.fit$residPV[[2]][,1])
  lmResid <- as.vector(lm.fit.mrps22$residuals)
  expect_equal(mvrResid, lmResid)

  # compare residual covariance
  composite <- rowMeans(lm.fit.comp$PV.residuals)
  mrps22 <- lm.fit.mrps22$residuals
  ee <- cbind(composite, mrps22)
  lmResidCov <- t(ee) %*% ee
  expect_equivalent(mvrlm.fit$residCov, lmResidCov)
})

context("Multivariate Regression: 2 DVs (both PVs)")
test_that("mvrlm.sdf results align with lm.sdf", {
  skip_on_cran()
  # compare coefficient tables
  mvrlm.fit <- mvrlm.sdf(algebra | geometry ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.alg <- lm.sdf(algebra ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.geom <- lm.sdf(geometry ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  expect_equal(mvrlm.fit$coefmat$algebra, lm.fit.alg$coefmat)
  expect_equal(mvrlm.fit$coefmat$geometry, lm.fit.geom$coefmat)
  # compare residuals
  attr(lm.fit.alg$PV.residuals, "dimnames") <- NULL
  attr(mvrlm.fit$residPV[[1]], "dimnames") <- NULL
  expect_equal(mvrlm.fit$residPV[[1]], lm.fit.alg$PV.residuals)
  attr(lm.fit.geom$PV.residuals, "dimnames") <- NULL
  attr(mvrlm.fit$residPV[[2]], "dimnames") <- NULL
  expect_equal(mvrlm.fit$residPV[[2]], lm.fit.geom$PV.residuals)
  
  # compare residual covariance
  algebra <- rowMeans(lm.fit.alg$PV.residuals)
  geometry <- rowMeans(lm.fit.geom$PV.residuals)
  ee <- cbind(algebra, geometry)
  lmResidCov <- t(ee) %*% ee
  expect_equivalent(mvrlm.fit$residCov, lmResidCov)
})

context("Multivariate Regression: 3 DVs (all PVs)")
test_that("mvrlm.sdf results align with lm.sdf",{
  skip_on_cran()
  mvrlm.fit <- mvrlm.sdf(algebra | geometry | measurement ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  
  ### compare coefficients
  lm.fit.alg <- lm.sdf(algebra ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.geom <- lm.sdf(geometry ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  lm.fit.meas <- lm.sdf(measurement ~ dsex + m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  expect_equal(mvrlm.fit$coefmat$algebra, lm.fit.alg$coefmat)
  expect_equal(mvrlm.fit$coefmat$geometry, lm.fit.geom$coefmat)
  expect_equal(mvrlm.fit$coefmat$measurement, lm.fit.meas$coefmat)
  
  # compare residuals
  attr(lm.fit.alg$PV.residuals, "dimnames") <- NULL
  attr(mvrlm.fit$residPV[[1]], "dimnames") <- NULL
  expect_equal(mvrlm.fit$residPV[[1]], lm.fit.alg$PV.residuals)
  attr(lm.fit.geom$PV.residuals, "dimnames") <- NULL
  attr(mvrlm.fit$residPV[[2]], "dimnames") <- NULL
  expect_equal(mvrlm.fit$residPV[[2]], lm.fit.geom$PV.residuals)
  attr(lm.fit.meas$PV.residuals, "dimnames") <- NULL
  attr(mvrlm.fit$residPV[[3]], "dimnames") <- NULL
  expect_equal(mvrlm.fit$residPV[[3]], lm.fit.meas$PV.residuals)
  
  # compare residual covariance
  algebra <- rowMeans(lm.fit.alg$PV.residuals)
  geometry <- rowMeans(lm.fit.geom$PV.residuals)
  measurement <- rowMeans(lm.fit.meas$PV.residuals)
  ee <- cbind(algebra, geometry, measurement)
  lmResidCov <- t(ee) %*% ee
  expect_equivalent(mvrlm.fit$residCov, lmResidCov)
})

# regression tests 

context("mvrlm.sdf Regression tests")
test_that("mvrlm.sdf results remain the same", {
  skip_on_cran()
  
  # no pv case
  mvrlm.fit <- mvrlm.sdf(mrps51 | mrps22 ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  mvrlm2dvnon <- readRDS("mvrlm2dvnon.rds")
  expect_equal(mvrlm.fit$coefmat, mvrlm2dvnon$coefmat)
  expect_equal(mvrlm.fit$residPV, mvrlm2dvnon$residPV)
  expect_equal(mvrlm.fit$residCov, mvrlm2dvnon$residCov)
  
  # mixed DV case 
  mvrlm.fit <- mvrlm.sdf(composite | mrps22 ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  mvrlm2dvmix <- readRDS("mvrlm2dvmix.rds")
  expect_equal(mvrlm.fit$coefmat, mvrlm2dvmix$coefmat)
  expect_equal(mvrlm.fit$residPV, mvrlm2dvmix$residPV)
  expect_equal(mvrlm.fit$residCov, mvrlm2dvmix$residCov)

  # 2 PV case
  mvrlm.fit <- mvrlm.sdf(algebra | geometry ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  mvrlm.sdf.2dv <- readRDS("mvrlm2dv.rds")
  expect_equal(mvrlm.fit$coefmat, mvrlm.sdf.2dv$coefmat)
  expect_equal(mvrlm.fit$residPV, mvrlm.sdf.2dv$residPV)
  expect_equal(mvrlm.fit$residCov, mvrlm.sdf.2dv$residCov)
  # 3 PV case
  mvrlm.fit <- mvrlm.sdf(algebra | geometry | measurement ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  mvrlm.sdf.3dv <- readRDS("mvrlm3dv.rds")
  expect_equal(mvrlm.fit$coefmat, mvrlm.sdf.3dv$coefmat)
  expect_equal(mvrlm.fit$residPV, mvrlm.sdf.3dv$residPV)
  expect_equal(mvrlm.fit$residCov, mvrlm.sdf.3dv$residCov)
})

context("Wald Test Coefficient restrictions")
test_that("wald test works",{
  options(digits=2)
  mvr <- mvrlm.sdf(algebra | geometry ~ dsex | m072801, data = sdf, jrrIMax = 5, returnVarEstInputs = T)
  hypothesis <- c("geometry_dsexFemale = 0", "algebra_dsexFemale = 0")
  
  test1 <- linearHypothesis.edsurveyMvrlm(mvr, hypothesis = hypothesis, test = "F")
  test2 <- linearHypothesis.edsurveyMvrlm(mvr, hypothesis = hypothesis, test = "Chisq")

  waldtestF <- readRDS("waldtestF.rds")
  waldtestChisq <- readRDS("waldtestChisq.rds")
  # Regression tests for wald test output
  expect_equal(capture.output(test1)[1:12], waldtestF[1:12])
  expect_equal(capture.output(test2)[1:12], waldtestChisq[1:12])
})
