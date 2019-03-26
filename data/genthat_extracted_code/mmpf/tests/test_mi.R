test_that("permutationImportance works", {
  X = replicate(3, rnorm(50))
  y = X %*% runif(3)
  data = data.frame(X, y)
  fit = lm(y ~ -1 + X1 + X2 + X3, data)

  tmp = permutationImportance(data, c("X1", "X2"), "y", fit, 25)
  expect_that(tmp, is_a("numeric"))
  expect_that(length(tmp), equals(1L))

  ## full distribution of importances
  tmp = permutationImportance(data, c("X1", "X2"), "y", fit, 25,
    loss.fun = function(x, y) abs(x - y),
    contrast.fun = function(x, y) x - y)
  expect_that(tmp, is_a("matrix"))
  expect_that(dim(tmp), equals(c(50, 25)))

  ## local importance
  tmp = permutationImportance(data, c("X1", "X2"), "y", fit, 25,
    loss.fun = function(x, y) (x - y)^2,
    contrast.fun = function(x, y) rowMeans(x - y))
  expect_that(length(tmp), equals(50))
})
