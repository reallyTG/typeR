context("OptimCART")

test_that("Test CART with Australian Credit", {
  #Train a simply model
  modelFit <- Optim.CART(Y~., AustralianCredit, p = 0.7, seed=2018)
  expect_equal(class(modelFit), "Optim")
  #Print
  print(modelFit, plain=TRUE)
  print(modelFit, plain=FALSE)

  summary(modelFit)
  })
