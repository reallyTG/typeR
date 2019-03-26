library(BigVAR)


### Name: PredictVARX
### Title: One-step ahead predictions for VARX models
### Aliases: PredictVARX

### ** Examples

data(Y)
# fit a VAR_3(3)
mod <- VARXFit(Y,3,NULL,NULL)
pred <-PredictVARX(mod)




