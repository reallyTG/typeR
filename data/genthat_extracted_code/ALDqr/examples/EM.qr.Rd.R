library(ALDqr)


### Name: EM.qr
### Title: Quantile Regression Using Asymmetric Laplace Distribution
### Aliases: EM.qr
### Keywords: regression

### ** Examples

data(ais, package="sn")
attach(ais)
sexInd <- (sex=="female") + 0
x      <- cbind(1,LBM,sexInd)
y      <- BMI
tau    <- 0.5

## EM.qr
EM.qr(y,x,tau)





