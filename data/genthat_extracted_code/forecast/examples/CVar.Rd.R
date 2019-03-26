library(forecast)


### Name: CVar
### Title: k-fold Cross-Validation applied to an autoregressive model
### Aliases: CVar print.CVar
### Keywords: ts

### ** Examples


modelcv <- CVar(lynx, k=5, lambda=0.15)
print(modelcv)
print(modelcv$fold1)

library(ggplot2)
autoplot(lynx, series="Data") +
  autolayer(modelcv$testfit, series="Fits") +
  autolayer(modelcv$residuals, series="Residuals")
ggAcf(modelcv$residuals)




