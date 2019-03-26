# Prepare some linear pseudo-demographic data without ridges and noise
m = matrix(seq(1,1.99,by = 0.01), 10,10)
rownames(m) = paste("age", 1:10)
colnames(m) = 1980:1989

test_that("Testing smoothAPC on linear data w/o ridges, effects = FALSE", {
  sm = smoothAPC(m, effects = FALSE)
  expect_equivalent(sm$result, m)
  expect_null(sm$yearsEffect)
  expect_null(sm$cohortEffect)
})

# Matrix of noise
err = matrix(0, 10,10)
err[3,3] = 1000

test_that("Testing smoothAPC on linear data with one outlier and w/o ridges, effects = FALSE", {
  sm = smoothAPC(m + err, effects = FALSE)
  expect_equivalent(sm$result, m)
  expect_null(sm$yearsEffect)
  expect_null(sm$cohortEffect)
})

# Some nonlinear data
mm = m^10 + t(m)^9
mm = log(mm/(max(mm)*1.2))
exposure = exp(mm[,ncol(mm):1])
weights = sqrt((exposure * exp(mm))/(1 - exp(mm)))

test_that("Testing smoothAPC on nonlinear data with weights", {
  smm1 = smoothAPC(mm, effects = FALSE, weights = weights)
  smm2 = smoothAPC(mm, effects = FALSE)
  expect_true(sum(abs(smm1$result - smm2$result)) > 40)
})

test_that("Testing smoothAPC on nonlinear data with NAs with weights", {
  mm[3,3] = NA
  mm[5,5] = NA
  mm[7,7] = NA
  smm = smoothAPC(mm, effects = FALSE, weights = weights)
})

# Matrix with a cohort effect
coh = matrix(0, 10,10)
diag(coh) = 1000

test_that("Testing smoothAPC on linear data with one cohort effect and w/o period effects, effects = FALSE", {
  sm = smoothAPC(m + coh, effects = FALSE)
  expect_equivalent(sm$result, m)
  expect_null(sm$yearsEffect)
  expect_null(sm$cohortEffect)
})

# Matrix with a period effect
per = matrix(0, 10,10)
per[,5] = 1000

test_that("Testing smoothAPC on linear data with one period effect and w/o cohort effects, effects = FALSE", {
  sm = smoothAPC(m + per, effects = FALSE)
  expect_equivalent(sm$result, m)
  expect_null(sm$yearsEffect)
  expect_null(sm$cohortEffect)
})

test_that("Testing smoothAPC on linear data with one period effect and with one cohort effects, effects = FALSE", {
  sm = smoothAPC(m + per + coh, effects = FALSE)
  expect_equivalent(sm$result, m)
  expect_null(sm$yearsEffect)
  expect_null(sm$cohortEffect)
})

test_that("Testing smoothAPC on linear data with noise, one period effect and with one cohort effects, effects = TRUE", {
  sm = smoothAPC(m + per + coh + err, effects = TRUE)
  expect_equivalent(sm$result, m)
  expect_equivalent(sm$yearsEffect, per)
  expect_equivalent(sm$cohortEffect, coh)
})
