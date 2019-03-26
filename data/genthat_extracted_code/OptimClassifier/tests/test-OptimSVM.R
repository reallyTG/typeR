context("OptimSVM")

test_that("Test SVM with Australian Credit", {
  modelFit <- Optim.SVM(Y~., AustralianCredit, p = 55, seed=2018)
  expect_equal(class(modelFit), "Optim")
  #Print
  print(modelFit)
  print(modelFit, plain=TRUE)
  expect_equal(summary(modelFit)$kernel,2 )

  })
