library(greybox)


### Name: predict.alm
### Title: Forecasting using greybox functions
### Aliases: predict.alm predict.greybox forecast forecast.greybox
### Keywords: ts univar

### ** Examples


xreg <- cbind(rlaplace(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rlaplace(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")
inSample <- xreg[1:80,]
outSample <- xreg[-c(1:80),]

ourModel <- alm(y~x1+x2, inSample, distribution="dlaplace")

predict(ourModel,outSample)
predict(ourModel,outSample,interval="c")
plot(predict(ourModel,outSample,interval="p"))




