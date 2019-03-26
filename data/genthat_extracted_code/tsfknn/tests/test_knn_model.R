context("Building a knn model")

expect_error(knn_model(ts(1:5), lags = 0:3, k = 5))

expect_error(knn_model(ts(1:5), lags = 3:5, k = 1))

expect_error(knn_model(ts(1:5), lags = 2:4, k = 2))
