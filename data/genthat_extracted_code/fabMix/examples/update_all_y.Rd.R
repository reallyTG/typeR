library(fabMix)


### Name: update_all_y
### Title: Gibbs sampling for y in 'xCx' model
### Aliases: update_all_y

### ** Examples

library('fabMix')

n = 8                # sample size
p = 5                # number of variables
q = 2                # number of factors
K = 2                # true number of clusters

sINV_diag = 1/((1:p))    # diagonal of inverse variance of errors
set.seed(100)
syntheticDataset <- simData(sameLambda=TRUE,K.true = K, n = n, q = q, p = p, 
                        sINV_values = sINV_diag)
# use the real values as input and simulate factors
update_all_y(x_data = syntheticDataset$data, 
		mu = syntheticDataset$means, 
		SigmaINV = diag(1/diag(syntheticDataset$variance)), 
		Lambda = syntheticDataset$factorLoadings, 
		z = syntheticDataset$class)




