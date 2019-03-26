library(multiwave)


### Name: mfw_eval
### Title: evaluation of multivariate Fourier Whittle estimator
### Aliases: mfw_eval
### Keywords: ts nonparametric

### ** Examples

### Simulation of ARFIMA(0,d,0)
rho <- 0.4
cov <- matrix(c(1,rho,rho,1),2,2)
d <- c(0.4,0.2)
J <- 9
N <- 2^J

resp <- fivarma(N, d, cov_matrix=cov)
x <- resp$x
long_run_cov <- resp$long_run_cov

m <- 57 ## default value of Shimotsu
res_mfw <- mfw(x,m)
d <- res_mfw$d
G <- mfw_eval(d,x,m)
k <- length(d)
res_d <- optim(rep(0,k),mfw_eval,x=x,m=m,method='Nelder-Mead',lower=-Inf,upper=Inf)$par




