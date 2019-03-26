library(multiwave)


### Name: mfw_cov_eval
### Title: multivariate Fourier Whittle estimators
### Aliases: mfw_cov_eval
### Keywords: ts nonparametric

### ** Examples

### Simulation of ARFIMA(0,\code{d},0)
rho <- 0.4
cov <- matrix(c(1,rho,rho,1),2,2)
d <- c(0.4,0.2)
J <- 9
N <- 2^J

resp <- fivarma(N, d, cov_matrix=cov)
x <- resp$x
long_run_cov <- resp$long_run_cov

m <- 57 ## default value of Shimotsu
G <- mfw_cov_eval(d,x,m) # estimation of the covariance matrix when d is known



