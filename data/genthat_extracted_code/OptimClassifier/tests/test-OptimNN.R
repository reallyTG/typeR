context("OptimNN")

test_that("Test example with Australian Credit Dataset for NN", {
  modelFit <- Optim.NN(Y~., AustralianCredit, p = 0.65, seed=2018)
  expect_equal(class(modelFit), "Optim")
  #Print
  print(modelFit)
  print(modelFit, plain=TRUE)

  #Make sure if model was generated okey
  expect_equal(class(summary(modelFit)$value),"numeric")

  })
