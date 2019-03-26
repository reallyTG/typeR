library(circular)


### Name: bandwidth
### Title: Bandwidth Selectors for Kernel Density Estimation for Circular
###   Data
### Aliases: bw.cv.mse.circular bw.cv.ml.circular bw.nrd.circular
### Keywords: distribution smooth

### ** Examples

set.seed(12345)

## Example 1: von Mises ##
theta1 <- rvonmises(n=150,mu=circular(pi),kappa=2)

bw.nrd1 <- bw.nrd.circular(theta1)
bw.cv.mse1 <- bw.cv.mse.circular(theta1)
bw.cv.ml1 <- bw.cv.ml.circular(theta1)

## Linear plot
plot(function(x) dvonmises(circular(x), mu=circular(pi), kappa=2),
type="l", lwd=2, col=1, main="von Mises", xlab=expression(theta),
ylab="Density", from=0, to=2*pi)
plot(approxfun(density.circular(x=theta1, bw=bw.nrd1)), col=2, from=0, to=2*pi, add=TRUE)
plot(approxfun(density.circular(x=theta1, bw=bw.cv.mse1)), col=3,
from=0, to=2*pi, add=TRUE)
plot(approxfun(density.circular(x=theta1, bw=bw.cv.ml1)), col=4, from=0,
to=2*pi, add=TRUE)
legend("topright", legend=c("True", "Taylor", "LSCV", "MLCV"), col=1:4, lwd=2)
rug(theta1)

## Circular plot
dvonmises1 <- function(x) dvonmises(circular(x), mu=circular(pi), kappa=2)
curve.circular(dvonmises1, lwd=2, col=1, main="von Mises", xlim=c(-1.5,
1.5), ylim=c(-1.5,1.5))
lines(density.circular(x=theta1, bw=bw.nrd1), col=2)
lines(density.circular(x=theta1, bw=bw.cv.mse1), col=3)
lines(density.circular(x=theta1, bw=bw.cv.ml1), col=4)
legend("topright", legend=c("True", "Taylor", "LSCV", "MLCV"), col=1:4, lwd=2)
points(theta1)

## Example 2: mixture of von Mises ##

theta2 <- rmixedvonmises(n=150, mu1=circular(pi/2),
mu2=circular(3*pi/2), kappa1=5, kappa2=5,p=0.5)

bw.nrd2 <- bw.nrd.circular(theta2)
bw.cv.mse2 <- bw.cv.mse.circular(theta2)
bw.cv.ml2 <- bw.cv.ml.circular(theta2)

## Linear plot
plot(function(x) dmixedvonmises(circular(x), mu1=circular(pi/2),
mu2=circular(3*pi/2), kappa1=5, kappa2=5, p=0.5), type="l", lwd=2,
col=1, main="mixture of von Mises", xlab=expression(theta),
ylab="Density", from=0, to=2*pi)
lines(density.circular(x=theta2, bw=bw.nrd2), plot.type='line', col=2)
lines(density.circular(x=theta2, bw=bw.cv.mse2), plot.type='line',
col=3)
lines(density.circular(x=theta2, bw=bw.cv.ml2), plot.type='line', col=4)
rug(theta2)
legend("topright", legend=c("True", "Taylor", "LSCV", "MLCV"), col=1:4, lwd=2)

## Circular plot
dmixedvonmises1 <- function(x) dmixedvonmises(circular(x), mu1=circular(pi/2),
mu2=circular(3*pi/2), kappa1=5, kappa2=5, p=0.5)
curve.circular(dmixedvonmises1, join=TRUE,
xlim=c(-1.5, 1.5), ylim=c(-1.5, 1.5), lwd=2, col=1, main="mixture of von
Mises")
lines(density.circular(x=theta2, bw=bw.nrd2), col=2)
lines(density.circular(x=theta2, bw=bw.cv.mse2), col=3)
lines(density.circular(x=theta2, bw=bw.cv.ml2), col=4)
points(theta2)
legend("topright", legend=c("True", "Taylor", "LSCV", "MLCV"), col=1:4, lwd=2)

## Example 3: mixture of von Mises and Wrapped Cauchy ##

rmixture <- function(n){
  x <- circular(sapply(runif(n), function(u) ifelse(u>0.5,
  rvonmises(n=1, mu=circular(pi),kappa=10),
  rwrappedcauchy(n=1,mu=circular(pi/2),rho=0.75))))
  return(x)
}

theta3 <- rmixture(n=150)

bw.nrd3 <- bw.nrd.circular(theta3)
bw.cv.mse3 <- bw.cv.mse.circular(theta3, lower=0.1, upper=100)
bw.cv.ml3 <- bw.cv.ml.circular(theta3, lower=0.1, upper=100)

dmixture <- function(x) (dvonmises(x, mu=circular(pi),
kappa=10)+dwrappedcauchy(x, mu=circular(pi/2), rho=0.75))/2
curve.circular(dmixture, join=TRUE, xlim=c(-1.5, 1.5), ylim=c(-1.5,
1.5), lwd=2, col=1, main="mixture of von Mises and Wrapped Normal")
lines(density.circular(x=theta3, bw=bw.nrd3), col=2)
lines(density.circular(x=theta3, bw=bw.cv.mse3), col=3)
lines(density.circular(x=theta3, bw=bw.cv.ml3), col=4)
legend("topright", legend=c("True", "Taylor", "LSCV", "MLCV"), col=1:4, lwd=2)
points(theta3)



