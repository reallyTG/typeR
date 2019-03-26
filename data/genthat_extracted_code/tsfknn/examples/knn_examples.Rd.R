library(tsfknn)


### Name: knn_examples
### Title: Examples of the model associated with a prediction
### Aliases: knn_examples

### ** Examples

pred <- knn_forecasting(ts(1:8), h = 1, lags = 1:2, k = 2)
knn_examples(pred)



