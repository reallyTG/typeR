library(forestmangr)


### Name: rmse_per
### Title: RMSE of an estimator in percentage
### Aliases: rmse_per
### Keywords: Root-Mean-Square-Error

### ** Examples

library(forestmangr)
data("exfm11")
exfm11

# RMSE of an estimator, given the data frame and quoted variable names:
rmse_per(exfm11, "TH", "TH_EST3")

# RMSE of an estimator, given the vectors for observed and estimated values:
rmse_per(y = exfm11$TH, yhat = exfm11$TH_EST3)




