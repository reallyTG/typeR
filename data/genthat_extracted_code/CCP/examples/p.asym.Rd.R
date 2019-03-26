library(CCP)


### Name: p.asym
### Title: Asymptotic tests for the statistical significance of canonical
###   correlation coefficients
### Aliases: p.asym
### Keywords: htest multivariate

### ** Examples


## Load the CCP package:
library(CCP)



## Simulate example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Calculate canonical correlations ("cancor" is part of the stats-package):
rho <- cancor(X,Y)$cor

## Define number of observations, number of dependent variables, number of independent variables.
N = dim(X)[1]       
p = dim(X)[2]   
q = dim(Y)[2]

## Calculate p-values using the F-approximations of different test statistics:
p.asym(rho, N, p, q, tstat = "Wilks")
p.asym(rho, N, p, q, tstat = "Hotelling")
p.asym(rho, N, p, q, tstat = "Pillai")
p.asym(rho, N, p, q, tstat = "Roy")

## Plot the F-approximation for Wilks' Lambda, considering 3, 2, or 1 canonical correlation(s):
res1 <- p.asym(rho, N, p, q)
plt.asym(res1,rhostart=1)
plt.asym(res1,rhostart=2)
plt.asym(res1,rhostart=3)



