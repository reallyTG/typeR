context("KNN regression")

model <- knn_model(ts(c(2, 3, 1, 5, 4, 0, 7, 1, 2)), lags = 1:2, k = 2)
r <- list(
  prediction = 3,
  neighbors = c(3, 4)
)
test_that("knn regression with one target", {
  expect_equal(regression(model, c(1, 2)), r)
})


model <- knn_model(ts(c(2, 3, 1, 5, 4, 0, 7, 1, 2)), lags = 1:2, k = 2, nt = 2)
r <- list(
  prediction = c(3, 4.5),
  neighbors = c(3, 4)
)

test_that("knn regression with multiple targets", {
  expect_equal(regression(model, c(1, 2)), r)
})
