library(YieldCurve)


### Name: ECBYieldCurve
### Title: Yield curve data spot rate, AAA-rated bonds, maturities from 3
###   months to 30 years
### Aliases: ECBYieldCurve
### Keywords: datasets

### ** Examples

### plot ECB Yield Curve ###
data(ECBYieldCurve)

first(ECBYieldCurve,'3 day')
last(ECBYieldCurve,'3 day')

mat.ECB <- tau <- c(3/12,6/12,1:30)

par(mfrow=c(2,3))
for( i in c(1,2,3,653,654,655) ){
plot(mat.ECB, ECBYieldCurve[i,], type="o", xlab="Maturities structure in years", ylab="Interest rates values")
title(main=paste("European Central Bank yield curve obeserved at",time(ECBYieldCurve[i], sep=" ") ))
grid()
}



