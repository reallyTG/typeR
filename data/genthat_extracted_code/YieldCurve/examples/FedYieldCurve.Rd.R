library(YieldCurve)


### Name: FedYieldCurve
### Title: Federal Reserve interest rates
### Aliases: FedYieldCurve
### Keywords: datasets

### ** Examples

require(xts)
require(YieldCurve)
data(FedYieldCurve)

first(FedYieldCurve,'3 month')
last(FedYieldCurve,'3 month')
mat<-c(3/12, 0.5, 1,2,3,5,7,10)

par(mfrow=c(2,3))
for( i in c(1,2,3,370,371,372) ){
plot(mat, FedYieldCurve[i,], type="o", xlab="Maturities structure in years", ylab="Interest rates values")
title(main=paste("Federal Reserve yield curve obeserved at",time(FedYieldCurve[i], sep=" ") ))
grid()
}



