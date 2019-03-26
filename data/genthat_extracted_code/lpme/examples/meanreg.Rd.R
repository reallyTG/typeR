library(lpme)


### Name: meanreg
### Title: Local Polynomial Estimators for Nonparametric Mean Regression
### Aliases: meanreg

### ** Examples

#############################################
## X - True covariates
## W - Observed covariates
## Y - individual response
rm(list=ls())
library(lpme)

## sample size:
n =100;
## Function gofx(x) to estimate
gofx  = function(x){ 1/4*x + x^2/4 }
xgrid = seq(-2, 2, 0.02)

## Generate data
sigma_e  = 0.5;
sigma_x = 1; X = rnorm(n, 0, sigma_x); 
## Sample Y
Y  = gofx(X) + rnorm(n, 0, sigma_e);
##------------------  method Based on X ---------------------------
ghat_X= meanreg(Y, X, 0.1, method="naive", xgrid=xgrid);

## reliability ratio
lambda=0.85;
sigma_u  = sqrt(1/lambda-1)*sigma_x;
print( sigma_x^2/(sigma_x^2 + sigma_u^2) );
W=X+rnorm(n,0,sigma_u);
#W=X+rlaplace(n,0,sigma_u/sqrt(2));
  
##------------------  method Based on W ---------------------------
ghat_W=meanreg(Y, W, 0.1, method="naive", xgrid=xgrid);

##------------------ JASA method -------------------------------------
h = 0.13; 
ghat_JASA=meanreg(Y, W, h, method="DFC", sig=sigma_u, 
                  error="laplace", xgrid=xgrid);

##------------------ Our method -------------------------
ghat_NEW=meanreg(Y, W, h, method="HZ", sig=sigma_u, 
                 error="laplace", xgrid=xgrid);

## plots
plot(xgrid, gofx(xgrid), "l", main="Individual", lwd="2")
lines(xgrid, ghat_NEW$yhat, lty="dashed", col="2",lwd="3")
lines(xgrid, ghat_JASA$yhat, lty="dotted", col="3",lwd="3")
lines(xgrid, ghat_X$yhat, lty="dashed", col="4",lwd="2")
lines(xgrid, ghat_W$yhat, lty="dashed", col="5",lwd="3")



