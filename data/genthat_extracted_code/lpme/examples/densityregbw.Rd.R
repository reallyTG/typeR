library(lpme)


### Name: densityregbw
### Title: Bandwidth Selector for Conditional Density Estimation with
###   Covariate Measurement Error
### Aliases: densityregbw

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
  location - sign(rrrr - 0.5) * scale * (log(2) + ifelse(rrrr < 0.5, log(rrrr), log1p(-rrrr)))
}
## sample size:
n =100;
## Function f(y|x) to estimate#
mofx = function(x){ x }
sofx = function(x){ 0.5 } 
fy_x=function(y,x) dnorm(y, mofx(x), sofx(x));
## Generate data
sigma_x = 1; X = rnorm(n, 0, sigma_x); 
## Sample Y
Y = rep(0, n);
for(i in 1:n){
  Y[i] = mofx(X[i]) + rnorm(1, 0, sofx(X[i]));
}

## reliability ratio
lambda=0.7;
sigma_u  = sqrt(1/lambda-1)*sigma_x;
#W=X+rnorm(n,0,sigma_u);
W=X+rlap(n,0,sigma_u/sqrt(2));

##----- naive kernel density estimate  ---- 
fitbw = densityregbw(Y, W, K1 = "Gauss", K2 = "Gauss")
fhat1 = densityreg(Y, W, bw=fitbw$bw, K1 = "Gauss", K2 = "Gauss");

###----- naive kernel density estimate with mean adjustment  ---- 
#fitbw = densityregbw(Y, W, K1 = "Gauss", K2 = "Gauss", 
#                     mean.estimate = "kernel")
#fhat2 = densityreg(Y, W, bw=fitbw$bw, K1 = "Gauss", K2 = "Gauss", 
#                   mean.estimate = "kernel");

##----- proposed method without mean adjustment  ---- 
fitbw = densityregbw(Y, W, sig=sigma_u, K1="SecOrder", K2="Gauss")
fhat3 = densityreg(Y, W, bw=fitbw$bw, sig=sigma_u, K1="SecOrder", K2="Gauss");

##----- proposed method wit mean adjustment  ---- 
#fitbw = densityregbw(Y, W, sig=sigma_u, K1="SecOrder", K2="SecOrder", 
#                     mean.estimate = "kernel")
#fhat4 = densityreg(Y, W, bw=fitbw$bw, sig=sigma_u, K1="SecOrder", K2="SecOrder", 
#                   mean.estimate = "kernel");

par(mfrow=c(2,2))
plot(W,Y, col=2)
points(X,Y)
x0 = seq(0, 1, length.out = 3)
for(i in 1:length(x0)){
  plot(fhat1$ygrid, fy_x(fhat1$ygrid, x0[i]), "l", lwd="2", xlab = "y", ylab = "density",
       main = paste("Conditional density at x=", x0[i], sep=""), ylim=c(0,1.5));
  indx = which.min(abs(fhat1$xgrid-x0[i])) ## the index of xgrid that is closest to x0[i].
  lines(fhat1$ygrid, fhat1$fitxy[indx,], lwd=3, lty=2, col=1)
  #lines(fhat2$ygrid, fhat2$fitxy[indx,], lwd=3, lty=2, col=2)
  lines(fhat3$ygrid, fhat3$fitxy[indx,], lwd=3, lty=2, col=3)
  #lines(fhat4$ygrid, fhat4$fitxy[indx,], lwd=3, lty=2, col=4)
}




