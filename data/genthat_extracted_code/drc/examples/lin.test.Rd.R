library(drc)


### Name: lin.test
### Title: Lack-of-fit test for the mean structure based on cumulated
###   residuals
### Aliases: lin.test
### Keywords: models nonlinear

### ** Examples


## Fitting a log-logistic model to the dataset 'etmotc'
etmotc.m1<-drm(rgr1~dose1, data=etmotc[1:15,], fct=LL.4())

## Test based on umulated residuals
lin.test(etmotc.m1, 1000)
#lin.test(etmotc.m1, 10000, plotit = FALSE)  # more precise

## Fitting an exponential model to the dataset 'O.mykiss'
O.mykiss.m1<-drm(weight~conc, data=O.mykiss, fct=EXD.2(), na.action=na.omit)

## ANOVA-based test
modelFit(O.mykiss.m1)

## Test based on umulated residuals
lin.test(O.mykiss.m1, log = "", cl = 0.2, xlab = "Dose (mg/l)", main = "B", ylim = c(-0.6, 0.6))
#lin.test(O.mykiss.m1, noksSim = 10000, plotit = FALSE)  # more precise




