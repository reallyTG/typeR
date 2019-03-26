# Prepare some linear pseudo-demographic data without ridges and noise
m = matrix(seq(1,1.99,by = 0.01), 10,10)
rownames(m) = paste("age", 1:10)
colnames(m) = 1980:1989

# Matrix of zeros
zer = matrix(0, 10,10)

# Matrix of noise
err = zer
err[3,3] = 1000

# Matrix with a cohort effect
coh = matrix(0, 10,10)
diag(coh) = 1000

# Matrix with a period effect
per = matrix(0, 10,10)
per[,5] = 1000

test_that("Testing signifAutoSmoothAPC on linear data with noise", {
  skip_on_cran()
  sm = signifAutoSmoothAPC(data = m + err)
  expect_equivalent(sm$result, m)
  expect_equivalent(sm$yearsEffect, zer)
  expect_equivalent(sm$cohortEffect, zer)
  expect_equal(length(sm$affdDiagonals), 0)
  expect_equal(length(sm$affdYears), 0)
})

test_that("Testing signifAutoSmoothAPC on linear data with noise, period and cohort effects", {
  skip_on_cran()
  sm = signifAutoSmoothAPC(data = m + coh + per + err)
  expect_equivalent(sm$result, m)
  expect_equivalent(sm$yearsEffect, per)
  expect_equivalent(sm$cohortEffect, coh)
})

# Some nonlinear data
mm = m^10 + t(m)^9
mm = log(mm/(max(mm)*1.2))
exposure = exp(mm[,ncol(mm):1])
weights = sqrt((exposure * exp(mm))/(1 - exp(mm)))

test_that("Testing signifAutoSmoothAPC on linear data with noise, period and cohort effects", {
  skip_on_cran()
  smm1 = signifAutoSmoothAPC(data = mm)
  smm2 = signifAutoSmoothAPC(data = mm, weights = weights)
  expect_true(sum(abs(smm1$parameters - smm2$parameters)) > 0.1)
})
