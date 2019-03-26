library(forestmangr)


### Name: bias_per
### Title: Bias of an estimator in percentage
### Aliases: bias_per
### Keywords: bias

### ** Examples

library(forestmangr)
data("exfm11")
exfm11

# Bias of an estimator, given the data frame and quoted variable names:
bias_per(exfm11, "TH", "TH_EST3")

# Bias of an estimator, given the vectors for observed and estimated values:
bias_per(y = exfm11$TH, yhat = exfm11$TH_EST3)




