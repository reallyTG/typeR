library(BACprior)


### Name: BACprior.boot
### Title: A Bootstrap Procedure to Guide the Choice of Omega in the
###   Bayesian Adjustment for Confounding Algorithm.
### Aliases: BACprior.boot

### ** Examples

# Required package to simulate from a multivariate normal distribution.
require(mvtnorm);


# Simulate data
# n = 500 observations with 5 covariates.
# (U1, U2, U4) is multivariate normal with mean vector 0,
# variances of 1 and 0 pairwise correlations.
# U3 and U5 are causal effects of U2 and U4, respectively.
# X is a causal effect of U1, U2 and U4.
# Y is a causal effect of U3, U4, U5 and X.

set.seed(3417817);
n = 500;
U = rmvnorm(n = n, mean = rep(0, 5), sigma = diag(1, nrow = 5) + matrix(0, nrow = 5, ncol = 5));
U[,3] = U[,2] + rnorm(n);
U[,5] = U[,4] + rnorm(n);
X = U[,1] + U[,2] + U[,4] + rnorm(n);
Y = U[,3] + 0.1*U[,4] + U[,5] + 0.1*X + rnorm(n);

# Remove  ``#'' to run example 
# BACprior.boot(Y, X, U, maxmodels = 150); 
# $best
# [1] 1
# $MSE
#  [1] 0.001467631 0.001480494 0.001505006 0.001539194 0.001580756
# 0.001803000 0.002017034 0.002375198 0.002516998 0.002662188 0.002865611
# Best omega value would be 1
BACprior.lm(Y, X, U);
# $results
#       omega Posterior mean Standard deviation
#  [1,]   1.0      0.1089228         0.02951582
#  [2,]   1.1      0.1087689         0.02971457
#  [3,]   1.3      0.1084802         0.03008991
#  [4,]   1.6      0.1080900         0.03060449
#  [5,]   2.0      0.1076376         0.03121568
#  [6,]   5.0      0.1057020         0.03426854
#  [7,]  10.0      0.1046804         0.03696670
#  [8,]  30.0      0.1044711         0.04124805
#  [9,]  50.0      0.1047315         0.04291842
# [10,] 100.0      0.1051211         0.04462874
# [11,]   Inf      0.1058021         0.04703111

# Posterior mean doesn't change much with omega,
# but posterior standard deviation greatly increases.
# This supports the choice of omega = 1.



