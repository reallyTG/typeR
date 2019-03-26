library(fGarch)


### Name: predict-methods
### Title: GARCH Prediction Function
### Aliases: predict-methods predict,ANY-method predict,fGARCH-method
### Keywords: models

### ** Examples

## garchFit - 
   # Parameter Estimation of Default GARCH(1,1) Model:
   set.seed(123)
   fit = garchFit(~ garch(1, 1), data = garchSim(), trace = FALSE)
   fit

## predict -
   predict(fit, n.ahead = 10)
   predict(fit, n.ahead = 10,mse="uncond")

## predict with plotting: critical values = +- 2

   predict(fit, n.ahead = 10, plot=TRUE, crit_val=2)

## predict with plotting: automatic critical values 
## for different conditional distributions

  set.seed(321)
  fit2 = garchFit(~ garch(1, 1), data = garchSim(), trace = FALSE, cond.dist="sged")

## 95% confidence level
 predict(fit2,n.ahead=20,plot=TRUE) 

 set.seed(444)
 fit3 = garchFit(~ garch(1, 1), data = garchSim(), trace = FALSE, cond.dist="QMLE")

## 90% confidence level and nx=100

 predict(fit3,n.ahead=20,plot=TRUE,conf=.9,nx=100) 




