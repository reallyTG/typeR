library(smooth)


### Name: MAE
### Title: Error measures
### Aliases: MAE Errors MSE MRE MPE MAPE SMAPE MASE RelMAE RelMSE RelAME
###   sMSE sPIS sCE
### Keywords: models nonlinear regression smooth ts univar

### ** Examples



y <- rnorm(100,10,2)
esmodel <- es(y[1:90],model="ANN",h=10)

MAE(y[91:100],esmodel$forecast,digits=5)
MSE(y[91:100],esmodel$forecast,digits=5)

MPE(y[91:100],esmodel$forecast,digits=5)
MAPE(y[91:100],esmodel$forecast,digits=5)
MASE(y[91:100],esmodel$forecast,mean(abs(y[1:90])),digits=5)
MASE(y[91:100],esmodel$forecast,mean(abs(diff(y[1:90]))),digits=5)

esmodel2 <- es(y[1:90],model="AAN",h=10)
RelMAE(y[91:100],esmodel2$forecast,esmodel$forecast,digits=5)

MASE(y[91:100],esmodel$forecast,mean(abs(y[1:90]))^2,digits=5)

sMSE(y[91:100],esmodel$forecast,mean(abs(y[1:90])),digits=5)
sPIS(y[91:100],esmodel$forecast,mean(abs(y[1:90])),digits=5)
sCE(y[91:100],esmodel$forecast,mean(abs(y[1:90])),digits=5)




