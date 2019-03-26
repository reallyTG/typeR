library(sparseSEM)


### Name: elasticNetSMLcv
### Title: The Elastic Net penalty for SEM with user supplied alphas and
###   lambdas
### Aliases: elasticNetSMLcv
### Keywords: Elastic Net sparseSEM

### ** Examples

	library(sparseSEM)
	data(B);
	data(Y);
	data(X);
	data(Missing);
	OUT <- elasticNetSMLcv(Y, X, Missing, B, alpha_factors = c(0.75, 0.5, 0.25),
	lambda_factors=c(0.1, 0.01, 0.001), Verbose = 1);



