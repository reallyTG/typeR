library(sparseSEM)


### Name: elasticNetSMLpoint
### Title: The Elastic Net penalty for SEM
### Aliases: elasticNetSMLpoint
### Keywords: Elastic Net sparseSEM

### ** Examples

	library(sparseSEM)
	data(B);
	data(Y);
	data(X);
	data(Missing);
	OUT <- elasticNetSMLpoint(Y, X, Missing, B,
		alpha_factor = 0.5, lambda_factor = 0.1, Verbose = 1);



