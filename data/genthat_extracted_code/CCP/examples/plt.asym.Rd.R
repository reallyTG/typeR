library(CCP)


### Name: plt.asym
### Title: Plot asymptotic distributions for test statistics
### Aliases: plt.asym
### Keywords: htest multivariate

### ** Examples


## Load the CCP package:
library(CCP)



## Simulate  example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Calculate canonical correlations, using the function "cancor" from the "stats" package:
rho <- cancor(X,Y)$cor

## Define number of observations, number of dependent variables, number of independent variables.
N = dim(X)[1]       
p = dim(X)[2]   
q = dim(Y)[2]


## Plot the F-approximation for Wilks' Lambda, considering 3, 2, or 1 canonical correlation(s):
res1 <- p.asym(rho, N, p, q)
plt.asym(res1,rhostart=1)
plt.asym(res1,rhostart=2)
plt.asym(res1,rhostart=3)


## Plot the F-approximation for the Hotelling-Lawley Trace, considering 3, 2, or 1 canonical correlation(s):
res2 <- p.asym(rho, N, p, q, tstat="Hotelling")
plt.asym(res2,rhostart=1)
plt.asym(res2,rhostart=2)
plt.asym(res2,rhostart=3)



