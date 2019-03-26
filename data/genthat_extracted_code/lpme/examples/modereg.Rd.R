library(lpme)


### Name: modereg
### Title: Nonparametric Estimators for Nonparametric Mode Regression
### Aliases: modereg

### ** Examples

rm(list=ls())
library(lpme)

rlaplace=function (use.n, location = 0, scale = 1) 
{
  location <- rep(location, length.out = use.n)
  scale <- rep(scale, length.out = use.n)
  rrrr <- runif(use.n)
  location - sign(rrrr - 0.5) * scale * 
    (log(2) + ifelse(rrrr < 0.5, log(rrrr), log1p(-rrrr)))
}

## sample size:
n =100;
## Function m(x) to estimate#
gofx1  = function(x){ (x+x^2) }
gofx2  = function(x){ (x+x^2)-6 }
xgrid	= seq(-2, 2, length.out=100); 
ngrid	= length(xgrid)

## Sample X
X = rnorm(n, 0, 1); sigma_x=1;
## Sample Y
Y = rep(0, n);
U = runif(n);
for(i in 1:n){
  if(U[i]<0.5){
    Y[i] = rnorm(1, gofx1(X[i]), 1);
  }else{
    Y[i] = rnorm(1, gofx2(X[i]), 1);
  }
}
## reliability ratio
lambda=0.9;
sigma_u  = sqrt(1/lambda-1)*sigma_x;
W=X+rlaplace(n,0,sigma_u/sqrt(2));

## mode estimates
hhxy = c(0.15, 1)
## Note you needs to use the following code to calculate bandwidth
## It is not run here due to the time constrain of runing examples. 
#hhxy = moderegbwSIMEX(Y, W, method="CV-density", p.order=0, 
#                       sig=sigma_u, B=5, length.h=10)$bw;
fit = modereg(Y, W, xgrid=xgrid, bw=hhxy, sig=sigma_u, p.order=0,
              PLOT=TRUE);

## Plot
plot(xgrid, gofx1(xgrid), "l", lwd="2", ylim=c(-9,7), xlim=c(-2,2));
lines(xgrid, gofx2(xgrid), "l", lwd="2");
points(rep(fit$xgrid,fit$x.num), fit$mode, col="3",lwd="2")



