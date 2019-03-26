library(INDperform)


### Name: nrmse
### Title: Normalized Root Mean Square Error
### Aliases: nrmse

### ** Examples

obs <- c(10, 14, 20)
pred <- c(9, 12, 13)
# Calculating the sd-based NRMSE for untransformed data
nrmse(pred, obs)
# Calculating the iq-based NRMSE for log(x+0.001) transformed data
nrmse(pred, obs, method = "iq", transformation = "other", trans_function = "exp(x)-0.001")



