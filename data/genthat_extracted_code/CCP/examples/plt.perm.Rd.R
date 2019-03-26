library(CCP)


### Name: plt.perm
### Title: Plot permutation distributions for test statistics
### Aliases: plt.perm
### Keywords: htest multivariate nonparametric

### ** Examples


## Load the CCP package:
library(CCP)



## Simulate example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Calculate canonical correlations:
rho <- cancor(X,Y)$cor

## Define number of observations, number of dependent variables, number of independent variables.
N = dim(X)[1]       
p = dim(X)[2]   
q = dim(Y)[2]


# plot the permutation distribution of an F approximation for Wilks' Lambda, considering 3 and 2 canonical correlations:
out1 <- p.perm(X, Y, nboot = 999, rhostart = 1)  
plt.perm(out1)    
out2 <- p.perm(X, Y, nboot = 999, rhostart = 2)  
plt.perm(out2) 


# plot the permutation distribution of an F approximation for the Pillai-Bartlett Trace, considering 3, 2, and 1 canonical correlation(s):
res1 <- p.perm(X, Y, nboot = 999, rhostart = 1, type = "Pillai")  
plt.perm(res1)    
res2 <- p.perm(X, Y, nboot = 999, rhostart = 2, type = "Pillai")  
plt.perm(res2) 
res3 <- p.perm(X, Y, nboot = 999, rhostart = 3, type = "Pillai")  
plt.perm(res3)




