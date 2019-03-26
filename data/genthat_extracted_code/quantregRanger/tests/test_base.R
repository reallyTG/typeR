context("Output check")

test_that("quantregRanger", {
  y = rnorm(150)
  x = cbind(y + rnorm(150), rnorm(150))
  data = data.frame(x,y)
  mod = quantregRanger(y ~ ., data = data, params.ranger = list(mtry = 2))
  preds = predict(mod, data = data[1:5, ], quantiles = c(0.1, 0.5, 0.9))
  
  expect_true(is.matrix(preds))
  expect_true(all(!preds == 0))
  expect_lte(preds[1,1], preds[1,2])
  expect_lte(preds[1,2], preds[1,3])
})
