library(tsfknn)


### Name: nearest_neighbors
### Title: Nearest neighbors associated with predictions
### Aliases: nearest_neighbors

### ** Examples

pred <- knn_forecasting(UKgas, h = 4, lags = 1:4, k = 2, msas = "MIMO")
nearest_neighbors(pred)



