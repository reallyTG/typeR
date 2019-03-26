library(lpme)


### Name: moderegbw
### Title: Cross-Validation Bandwidth Selector for Nonparametric Mode
###   Regression
### Aliases: moderegbw

### ** Examples

rm(list=ls())
library(lpme)
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

## mode estimates
h1ref = c(1.06*sd(X)*n^(-0.2));
h2ref = c(1.06*sd(Y)*n^(-0.2));
## In practice moer fine grids are desired. 
hx = seq(h1ref*0.2, h1ref*1.5, length.out = 10); 
hy = seq(h2ref*0.8, h2ref, length.out = 2); 
hhxy = moderegbw(Y, X, method="CV-mode", p.order=0,
                 h1=hx, h2=hy)$bw;
fit = modereg(Y, X, xgrid=xgrid, bw=hhxy, p.order=0, PLOT=TRUE);

## Plot
plot(xgrid, gofx1(xgrid), "l", lwd="2", ylim=c(-9,7), xlim=c(-2,2));
lines(xgrid, gofx2(xgrid), "l", lwd="2");
points(rep(fit$xgrid,fit$x.num), fit$mode, col="3",lwd="2")



