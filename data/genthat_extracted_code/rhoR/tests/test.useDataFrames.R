# library(testthat)
# context("Test using data.frame for functions")
# 
# test_that("data.frame for baserate", {
#   r = baserate(data = as.data.frame(codeSet))
#   
#   expect_equal(r$rho, 1)
#   expect_equal(r$kappa, 0.625)
# })
# 
# test_that("data.frame for kappa", {
#   kp = kappa(data = as.data.frame(codeSet))
#   kp2= kappaSet(set = as.data.frame(codeSet))
# 
#   expect_equal(kp, 0.625)
#   expect_equal(kp, kp2)
# })
# 
# test_that("data.frame for baserateSet", {
#   br = baserate(data = as.data.frame(codeSet))
#   br2 = baserateSet(set = as.data.frame(codeSet))
# 
#   expect_equal(br$firstBaserate, 0.1)
#   expect_equal(br$secondBaserate, 0.125)
#   expect_equal(br$averageBaserate, 0.1125)
#   expect_equal(br, br2)
# })
# 
# test_that("data.frame for getTestSet", {
#   testSetLength = 20
#   testSetInflation = 0.2
#   
#   testSet = getTestSet(set = as.data.frame(codeSet), testSetLength = testSetLength, testSetBaserateInflation = testSetInflation)
#   testSetBR = baserate(testSet)
#   
#   expect_is(testSet, "data.frame");
#   expect_gte(testSetBR$firstBaserate, testSetInflation)
#   expect_gte(testSetBR$secondBaserate, testSetInflation)
# })
# 
# test_that("data.frame for rho", {
#   r = rho(data = as.data.frame(codeSet))
#   r2= rhoSet(set = as.data.frame(codeSet))
#   
#   expect_equal(r$rho, 1)
#   expect_equal(r$kappa, 0.625)
#   expect_equal(r, r2)
# })