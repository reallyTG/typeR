context("Optim.GLM")

test_that("Test GLM with Australian Credit", {
  #Train a simply model
  modelFit <- Optim.GLM(Y~., AustralianCredit, p = 0.7, seed=2018,criteria="tii_error")
  expect_equal(class(modelFit), "Optim")
  #Print
  print(modelFit)
  #Make sure if model was generated okey
  expect_equal(class(summary(modelFit)$coef),"matrix")
  })
