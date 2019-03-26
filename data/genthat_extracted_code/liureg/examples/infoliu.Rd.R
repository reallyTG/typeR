library(liureg)


### Name: infoliu.liu
### Title: Model Selection Criteria for Liu Regression
### Aliases: infoliu infoliu.liu
### Keywords: AIC BIC

### ** Examples

mod<-liu(y~X1+X2+X3+X4, data = as.data.frame(Hald), d = seq(-5, 5, 0.1), scaling = "centered")

infoliu(mod)

## AIC values
infoliu(mod)[,1]

## BIC values
infoliu(mod)[,2]



