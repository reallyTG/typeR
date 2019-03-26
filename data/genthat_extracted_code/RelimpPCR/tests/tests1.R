require(RelimpPCR)
require(testthat)

context("Test1 Output")

Y = mtcars[,1]
X = mtcars[,2:6]

Z = RelimpPCR(Y,X,0.8,random_seed = 123,plot_this = F,validation_split = 0.8,multicore = F)
print("RelimpPCR successful. Checking output...")

test_that("Check Relimp PCA R2 Train",{
  expect_equal(Z$relimp_pca_r2_train[1],0.8272183,tolerance=1e-6)
  expect_equal(Z$relimp_pca_r2_train[length(Z$relimp_pca_r2_train)], 0.9056683,tolerance=1e-6)
})
test_that("Check Relimp PCA R2 Test",{
  expect_equal(Z$relimp_pca_r2_test[1],0.8022651,tolerance=1e-6)
  expect_equal(Z$relimp_pca_r2_test[length(Z$relimp_pca_r2_test)], 0.7338205,tolerance=1e-6)
})
test_that("Check Original R2 Train",{
  expect_equal(Z$original_r2_train[1],0.7442582,tolerance=1e-6)
  expect_equal(Z$original_r2_train[length(Z$original_r2_train)],0.9056683,tolerance=1e-6)
})
test_that("Check Original R2 Test",{
  expect_equal(Z$original_r2_test[1],0.6964342,tolerance=1e-6)
  expect_equal(Z$original_r2_test[length(Z$original_r2_test)],0.7338205,tolerance=1e-6)
})
test_that("Check PCA R2 Train",{
  expect_equal(Z$pca_r2_train[1],0.8272183,tolerance=1e-6)
  expect_equal(Z$pca_r2_train[length(Z$pca_r2_train)],0.9056683,tolerance=1e-6)
})
test_that("Check PCA R2 Test",{
  expect_equal(Z$pca_r2_test[1],0.8022651,tolerance=1e-6)
  expect_equal(Z$pca_r2_test[length(Z$pca_r2_test)],0.7338205,tolerance=1e-6)
})
test_that("Check Relimp R2 Train",{
  expect_equal(Z$relimp_r2_train[1],0.7977666,tolerance=1e-6)
  expect_equal(Z$relimp_r2_train[length(Z$relimp_r2_train)],0.9056683,tolerance=1e-6)
})
test_that("Check Relimp R2 Test",{
  expect_equal(Z$relimp_r2_test[1],0.7571750,tolerance=1e-6)
  expect_equal(Z$relimp_r2_test[length(Z$relimp_r2_test)],0.7338205,tolerance=1e-6)
})
test_that("Check for Best Model",{
  expect_is(Z$best_model,"lm")
})