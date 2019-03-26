library(drc)


### Name: mr.test
### Title: Mizon-Richard test for dose-response models
### Aliases: mr.test
### Keywords: models nonlinear

### ** Examples


## Fitting log-logistic and Weibull models 
## The Weibull model is the alternative
etmotc.m1<-drm(rgr1~dose1, data=etmotc[1:15,], fct=LL.4())
etmotc.m2 <- update(etmotc.m1, fct=W1.4())

## Fitting the fitted model (using the alternative model)
etmotc.m3 <- drm(fitted(etmotc.m1)~dose1, data=etmotc[1:15,], fct=W1.4())

## Handling missing values
xVec <- etmotc[1:15,]$dose1
xVec[1:8] <- 1e-10  # avoiding 0's

## Obtaining the Mizon-Richard test
mr.test(etmotc.m1, etmotc.m2, etmotc.m3, xVec, var.equal = FALSE)




