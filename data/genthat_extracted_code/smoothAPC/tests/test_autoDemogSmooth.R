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

test_that("Testing autoSmoothAPC on linear data with noise, effects = FALSE", {
  sm = autoSmoothAPC(m + err, effects = FALSE)
  expect_equivalent(sm$result, m)
  expect_null(sm$yearsEffect)
  expect_null(sm$cohortEffect)
})

test_that("Testing autoSmoothAPC on linear data with noise, effects = TRUE", {
  sm = autoSmoothAPC(m + err, effects = TRUE)
  expect_equivalent(sm$result, m)
  expect_equivalent(sm$yearsEffect, zer)
  expect_equivalent(sm$cohortEffect, zer)
})

test_that("Testing autoSmoothAPC on linear data with noise, preiod and cohort effects, effects = TRUE", {
  sm = autoSmoothAPC(m + coh + per + err, effects = TRUE)
  all.equal(sm$result, m, tolerance = 1e-7, check.attributes = F)
  all.equal(sm$yearsEffect, per, tolerance = 1e-7, check.attributes = F)
  all.equal(sm$cohortEffect, coh, tolerance = 1e-7, check.attributes = F)
})
