library(CCP)


### Name: p.perm
### Title: Permutation test for the significance of canonical correlation
###   coefficients
### Aliases: p.perm
### Keywords: htest multivariate nonparametric

### ** Examples


## Load the CCP package:
library(CCP)


## Simulate example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Run permutation test using Wilks Lambda (default) as test statistic; include different numbers of canonical correlations:
p.perm(X, Y, nboot = 999, rhostart = 1)
p.perm(X, Y, nboot = 999, rhostart = 2)
p.perm(X, Y, nboot = 999, rhostart = 3)


## Run permutation tests based on different test statistics:
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Wilks")        
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Hotelling")
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Pillai")
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Roy")

## Plot the permutation distribution, with the value of the original statistic marked:
out <- p.perm(X, Y, nboot = 999, rhostart = 3, type = "Hotelling")
plt.perm(out)



