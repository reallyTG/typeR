library(extremefit)


### Name: predict.hill
### Title: Predict the adaptive survival or quantile function
### Aliases: predict.hill

### ** Examples

x <- abs(rcauchy(100))
hh <- hill(x)
#example for a fixed value of threshold
predict(hh, threshold = 3)
#example for a fixed rank value of threshold
predict(hh, threshold.rank = 30)




