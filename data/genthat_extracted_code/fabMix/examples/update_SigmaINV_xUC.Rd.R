library(fabMix)


### Name: update_SigmaINV_xUC
### Title: Gibbs sampling for Sigma^{-1} per component for xUC models
### Aliases: update_SigmaINV_xUC

### ** Examples

library('fabMix')
# simulate some data
n = 8                # sample size
p = 5                # number of variables
q = 2                # number of factors
K = 2                # true number of clusters
sINV_diag = 1/((1:p))    # diagonal of inverse variance of errors
set.seed(100)
syntheticDataset <- simData(sameLambda=TRUE,K.true = K, n = n, q = q, p = p, 
                        sINV_values = sINV_diag)

# use the real values as input and update SigmaINV
update_SigmaINV_xUC(x_data = syntheticDataset$data, 
	z = syntheticDataset$class, 
	y = syntheticDataset$factors, 
	Lambda = syntheticDataset$factorLoadings, 
	mu = syntheticDataset$means, 
	K = K, 
	alpha_sigma = 0.5, beta_sigma = 0.5)




