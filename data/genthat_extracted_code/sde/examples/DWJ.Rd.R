library(sde)


### Name: DWJ
### Title: Weekly closings of the Dow-Jones industrial average
### Aliases: DWJ
### Keywords: datasets

### ** Examples

data(DWJ)
ret <- diff(DWJ)/DWJ[-length(DWJ)]

par(mfrow=c(2,1))
par(mar=c(3,3,2,1))
plot(DWJ,main="Dow-Jones closings",ylab="",type="p")
plot(ret,main="Dow-Jones returns",ylab="",type="p")

cp <- cpoint(ret)
cp
abline(v=cp$tau0,lty=3)

cp <- cpoint(window(ret,end=cp$tau0))
cp
abline(v=cp$tau0,lty=3)



