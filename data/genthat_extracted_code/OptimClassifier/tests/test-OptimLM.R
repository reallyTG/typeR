context("Optim LM")

test_that("Test LM with Australian Credit", {
  #Train a simply model
  modelFit <- Optim.LM(Y~., AustralianCredit, p = 0.7, seed=2018,criteria="ti_error")
  expect_equal(class(modelFit), "Optim")
  #Print
  print(modelFit, plain=TRUE)
  print(modelFit, plain=FALSE)

  #Make sure if model was generated okey
  expect_equal(class(summary(modelFit)$coef),"matrix")
})
