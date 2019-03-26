library(GaussianHMM1d)


### Name: ForecastHMMPdf
### Title: Density function of a Gaussian HMM at time n+k
### Aliases: ForecastHMMPdf

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2) ;
eta <- c(.9,.1);
x <- seq(-1, 1, by = 0.01)
out <- ForecastHMMPdf(x,mu,sigma,Q,eta,3)
plot(x,out$f,type="l")




