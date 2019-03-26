library(BACprior)


### Name: BACprior.lm
### Title: Sensitivity of the Bayesian Adjustment for Confounding Algorithm
###   to the Value of the Hyperparameter Omega When the Outcome and the
###   Exposure Are Continuous Variables.
### Aliases: BACprior.lm

### ** Examples

# Required package to simulate from a multivariate normal distribution.
require(mvtnorm);
	
# Simulate data
# n = 500 observations with 10 covariates.
# (U1, U2, U4, U6, U7, U8, U9, U10) is multivariate normal
# with mean vector 0, variances of 1 and pairwise correlations of 0.25.
# U3 and U5 are causal effects of U2 and U4, respectively.
# X is a causal effect of U1, U2 and U4.
# Y is a causal effect of X, U3, U4 and U5.
# The true exposure effect is 0.1.
	ncov = 10;
	n = 500;
	U = rmvnorm(n = n, mean = rep(0, ncov),
	 sigma = diag(0.75, nrow = ncov) + matrix(0.25, nrow = ncov, ncol = ncov));
	U[,3] = U[,2] + rnorm(n);
	U[,5] = U[,4] + rnorm(n);
	X = 0.5*U[,1] + 0.5*U[,2] + U[,4] + rnorm(n);
	Y = U[,3] + 0.3*U[,4] + U[,5] + 0.1*X + rnorm(n);

	BACprior.lm(Y, X, U);
	


