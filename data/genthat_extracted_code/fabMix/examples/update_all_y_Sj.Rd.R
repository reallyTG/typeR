library(fabMix)


### Name: update_all_y_Sj
### Title: Gibbs sampling for y in 'xUx' model
### Aliases: update_all_y_Sj

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
# add some noise here:
SigmaINV <- array(data = 0, dim = c(K,p,p))
for(k in 1:K){
        diag(SigmaINV[k,,]) <- 1/diag(syntheticDataset$variance) + rgamma(p, shape=1, rate = 1)
}

# use the real values as input and simulate factors
update_all_y_Sj(x_data = syntheticDataset$data, 
		mu = syntheticDataset$means, 
		SigmaINV = SigmaINV, 
		Lambda = syntheticDataset$factorLoadings, 
		z = syntheticDataset$class)




