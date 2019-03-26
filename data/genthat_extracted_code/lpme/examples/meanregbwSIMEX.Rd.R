library(lpme)


### Name: meanregbwSIMEX
### Title: Cross-Validation Bandwidth Selector Using SIMEX for
###   Nonparametric Mean Regression
### Aliases: meanregbwSIMEX

### ** Examples

#############################################
## X - True covariates
## W - Observed covariates
## Y - individual response
rm(list=ls())
library(lpme)
## generate laplace
rlap=function (use.n, location = 0, scale = 1) 
{
location <- rep(location, length.out = use.n)
scale <- rep(scale, length.out = use.n)
rrrr <- runif(use.n)
location-sign(rrrr-0.5)*scale*(log(2)+ifelse(rrrr<0.5, log(rrrr), log1p(-rrrr)))
}

## sample size:
n =100;
## Function gofx(x) to estimate
gofx  = function(x){ 2*x*exp(-10*x^4/81) }

## Generate data
sigma_e  = 0.2;
sigma_x = 1; X = rnorm(n, 0, sigma_x); 
## Sample Y
Y  = gofx(X) + rnorm(n, 0, sigma_e);
## reliability ratio
lambda=0.85;
sigma_u  = sqrt(1/lambda-1)*sigma_x;
print( sigma_x^2/(sigma_x^2 + sigma_u^2) );
#W=X+rnorm(n,0,sigma_u);
W=X+rlap(n,0,sigma_u/sqrt(2));
  
#### SIMEX
#**Note: larger values for B and length.h are needed for accurate estimates.
#**e.g., k_fold=5, B=10, length.h=10 will be generally good. 
hwNEW = meanregbwSIMEX(Y, W, method="HZ", sig=sigma_u, error="laplace", k_fold=2, 
                        B=1, length.h=1)$bw
ghat_NEW = meanreg(Y, W, hwNEW , method="HZ", sig=sigma_u, error="laplace");

## plots
x = ghat_NEW$xgrid;
plot(x, gofx(x), "l", main="Individual", lwd="2")
lines(ghat_NEW$xgrid, ghat_NEW$yhat, lty="dashed", col="2",lwd="3")



