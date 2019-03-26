library(Brq)


### Name: Btqr
### Title: Bayesian tobit quantile regression
### Aliases: Btqr

### ** Examples

# Example 
set.seed(12345)
x <- abs(rnorm(100))
y <- -0.5 + x +(.25 + .25*x)*rnorm(100)
plot(x,y, type="n")
h <-(y > 0)
points(x[h],y[h],cex=.9,pch=16)
points(x[!h],y[!h],cex=.9,pch=1)
y <- pmax(0,y)
for(tau in (2:8)/9){
fit=Brq(y~x,tau=tau, method="Btqr", left=0, runs=1000, burn=500)$coef
# Note: runs =11000 and burn =1000
Xs=sort(x)
Xc=cbind(1,sort(x))
Xcf=Xc%*%c(fit)
Xcfp=pmax(0,Xcf)
lines(Xs,Xcfp,col="red")}



