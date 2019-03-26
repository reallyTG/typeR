library(fabMix)


### Name: simData2
### Title: Synthetic data generator 2
### Aliases: simData2

### ** Examples

library('fabMix')

n = 8                # sample size
p = 5                # number of variables
q = 2                # number of factors
K = 2                # true number of clusters

sINV_diag = 1/((1:p))    # diagonal of inverse variance of errors
set.seed(100)
syntheticDataset <- simData2(K.true = K, n = n, q = q, p = p, 
                        sINV_values = sINV_diag)
summary(syntheticDataset)



