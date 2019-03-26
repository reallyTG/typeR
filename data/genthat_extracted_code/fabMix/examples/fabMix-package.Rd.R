library(fabMix)


### Name: fabMix-package
### Title: Overfitting Bayesian Mixtures of Factor Analyzers with
###   Parsimonious Covariance and Unknown Number of Components
### Aliases: fabMix-package
### Keywords: package

### ** Examples

# TOY EXAMPLE (very small numbers... only for CRAN check purposes)

#################################################################
# (a) using 2 cores in parallel, each one running 2 heated chains.
#################################################################
library('fabMix')

n = 8                # sample size
p = 5                # number of variables
q = 2                # number of factors
K = 2		     # true number of clusters

sINV_diag = 1/((1:p))	 # diagonal of inverse variance of errors
set.seed(100)
syntheticDataset <- simData(sameLambda=TRUE,K.true = K, n = n, q = q, p = p, 
			sINV_values = sINV_diag)
colnames(syntheticDataset$data) <- paste0("x_",1:p)

# Run `fabMix` for a _small_ number of iterations  
#	considering only `UUU` (maximal model),
# 	using the default prior parallel heating parameters `dirPriorAlphas`.
#	NOTE: `dirPriorAlphas` may require some tuning in general.


qRange <- 2	# values for the number of factors (only the true number 
#                                                    is considered here)
Kmax <- 4	# number of components for the overfitted mixture model
nChains <- 2	# number of parallel heated chains

set.seed(1)
fm <- fabMix( model = c("UUU"), nChains = nChains, 
	rawData = syntheticDataset$data, outDir = "toyExample",
        Kmax = Kmax, mCycles = 4, burnCycles = 1, q = qRange,
        g = 0.5, h = 0.5, alpha_sigma = 0.5, beta_sigma = 0.5, 
        warm_up_overfitting = 2, warm_up = 5) 

# WARNING: the following parameters: 
#  Kmax, nChains, mCycles, burnCycles, warm_up_overfitting, warm_up 
#	 should take (much) _larger_ values. E.g. a typical implementation consists of:
#        Kmax = 20, nChains >= 3, mCycles = 1100, burnCycles = 100, 
#        warm_up_overfitting = 500, warm_up = 5000. 

# Now print a run summary and produce some plots. 
print(fm)
# you may also plot, summary the output. 

#################################################################
# (b) using 12 cores_____________________________________________
#_______4 models with 3 heated chains running in parallel________
#_______considering all 8 model parameterizations________________
#################################################################
## Not run: 
##D library('fabMix')
##D set.seed(99)
##D n = 100                # sample size
##D p = 30                # number of variables
##D q = 2                # number of factors
##D K = 5		     # number of clusters
##D sINV_diag = rep(1/100,p) 	# diagonal of inverse variance of errors
##D syntheticDataset <- simData(sameLambda=FALSE,K.true = K, n = n, q = q, p = p, 
##D 			sINV_values = sINV_diag)
##D colnames(syntheticDataset$data) <- paste0("x_",1:p)
##D qRange <- 1:3	# range of values for the number of factors
##D Kmax <- 20	# number of components for the overfitted mixture model
##D nChains <- 3	# number of parallel heated chains
##D 
##D # the next command takes ~ 1 hour in a Linux workstation with 12 threads.
##D fm <- fabMix( parallelModels = 4, 
##D 	nChains = nChains, 
##D 	model = c("UUU","CUU","UCU","CCU","UCC","UUC","CUC","CCC"), 
##D 	rawData = syntheticDataset$data, outDir = "toyExample_b",
##D         Kmax = Kmax, mCycles = 600, burnCycles = 100, q = qRange,
##D         g = 0.5, h = 0.5, alpha_sigma = 0.5, beta_sigma = 0.5, 
##D         warm_up_overfitting = 500, warm_up = 5000) 
##D print(fm)
##D plot(fm, what = "BIC")
##D plot(fm, what = "classification_pairs")
##D 
## End(Not run)




