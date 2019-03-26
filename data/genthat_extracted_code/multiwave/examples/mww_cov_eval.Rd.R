library(multiwave)


### Name: mww_cov_eval
### Title: multivariate wavelet Whittle estimation of the long-run
###   covariance matrix
### Aliases: mww_cov_eval
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

## wavelet coefficients definition
res_filter <- scaling_filter('Daubechies',8);
filter <- res_filter$h
M <- res_filter$M
alpha <- res_filter$alpha

LU <- c(2,11)

res_mww <- mww_cov_eval(d,x,filter,LU)




