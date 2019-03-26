context("Changing k in a knn model")

model <- knn_model(ts(1:10), lags = 2:3, k = 3)

expect_error(changeK(model) <-  8)
