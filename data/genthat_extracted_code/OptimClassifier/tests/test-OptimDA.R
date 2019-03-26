context("OptimDA")

test_that("Test DA methods with Australian Credit", {
  modelFit <- Optim.DA(Y~., AustralianCredit, p = 0.8, seed=2018)
  expect_equal(class(modelFit), "Optim")
  #Print
  print(modelFit)
  #Make sure if model was generated okey
  expect_equal(class(summary(modelFit)),"numeric")
})
