context("KNN forecasting function")

expect_error(knn_forecasting(ts(1:5), h = 1, 3:1, 2))

expect_error(knn_forecasting(ts(1:5), h = 1, 0:2, 2))

expect_error(knn_forecasting(ts(1:5), h = 1, lags = 3:5, k = 1))

pred <- knn_forecasting(ts(c(2, 3, 1, 5, 4, 0, 7, 1, 2)), h = 2, lags = 1:2, k = 2,
                        msas = "MIMO")
test_that("MIMO strategy predicts fine", {
  expect_equal(as.vector(pred$prediction), c(3, 4.5))
})

pred <- knn_forecasting(UKgas, h = 4, lags = 1:4, k = 2, msas = "MIMO")
nn <- nearest_neighbors(pred)

test_that("MIMO strategy predicts fine", {
  expect_equal(as.vector(pred$prediction), c(1125.45, 573.9, 314.6, 785.2))
})

test_that("MIMO strategy predicts fine", {
  expect_equal(unname(nn$instance), c(1163.9, 613.1, 347.4, 782.8))
})

n <- data.frame("Lag 4" = c(1087.0, 989.4),
                "Lag 3" = c(534.7, 477.1),
                "Lag 2" = c(281.8, 233.7),
                "Lag 1" = c(787.6, 730.0),
                "H1"    = c(1163.9, 1087.0),
                "H2"    = c(613.1, 534.7),
                "H3"    = c(347.4, 281.8),
                "H4"    = c(782.8, 787.6), check.names = FALSE
)

test_that("MIMO strategy predicts fine", {
  expect_equal(nn$nneighbors, n)
})
