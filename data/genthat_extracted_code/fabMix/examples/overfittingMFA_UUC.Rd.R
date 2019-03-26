library(fabMix)


### Name: overfittingMFA_UUC
### Title: Basic MCMC sampler for the 'UUC' model
### Aliases: overfittingMFA_UUC

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
colnames(syntheticDataset$data) <- paste0("x_",1:p)
Kmax <- 4       # number of components for the overfitted mixture model

set.seed(1)
overfittingMFA_UUC(x_data = syntheticDataset$data, 
	originalX = syntheticDataset$data, outputDirectory = 'outDir', 
	Kmax = Kmax, m = 5, burn = 1, 
	g = 0.5, h = 0.5, alpha_prior = rep(1, Kmax), 
	alpha_sigma = 0.5, beta_sigma = 0.5, 
	start_values = FALSE, q = 2,  gibbs_z = 1)
list.files('outDir')
unlink('outDir', recursive = TRUE)




