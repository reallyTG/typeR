test_that("marginalPrediction works", {
  X = replicate(3, rnorm(50))
  y = X %*% runif(3)
  data = data.frame(X, y)
  fit = lm(y ~ -1 + X1 + X2 + X3, data)
  tmp = marginalPrediction(data, c("X1", "X2"), c(10, 25), fit, FALSE,
    aggregate.fun = function(x) list("mean" = mean(x), "var" = var(x)))

  expect_that(tmp, is_a("data.table"))
  expect_that(names(tmp), equals(c("X1", "X2", "preds.mean", "preds.var")))
  expect_that(tmp$preds.mean, is_a("numeric"))
  expect_that(tmp$preds.var, is_a("numeric"))
  expect_that(all(tmp$preds.var > 0), is_true())
  expect_that(nrow(tmp), equals(10))
  
  tmp = marginalPrediction(data, c("X1", "X2"), c(10, 25), fit, TRUE,
    aggregate.fun = identity)
  expect_that(dim(tmp), equals(c(100, 27)))
})
