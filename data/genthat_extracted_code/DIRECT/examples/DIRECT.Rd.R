library(DIRECT)


### Name: DIRECT
### Title: Bayesian Clustering with the Dirichlet-Process Prior
### Aliases: DIRECT direct
### Keywords: cluster models multivariate ts

### ** Examples

## Not run: 
##D # Load replicated time-course gene expression data
##D # Use only first 50 genes for test run
##D data (tc.data)
##D data = tc.data[1:50,]
##D times = c(0,5,10,15,20,25,30,35,40,50,60,70,80,90,100,110,120,150)
##D nGene = nrow (data)
##D nTime=length (times)
##D SKIP = 2
##D 
##D # Initial values and MCMC specs
##D c.curr = rep (1, nGene)    # start with a single cluster
##D alpha.curr = 0.01
##D 
##D alpha.prior.shape = 1/nGene
##D alpha.prior.rate = 1
##D 
##D SAMPLE.C.METHOD="FRBT"    # method for sampling cluster memberships
##D PRIOR.MODEL = "OU"       # prior model for generating mean vector
##D ALPHA.METHOD = "MH"      # method for sampling concentration parameter
##D RELABEL.THRESHOLD=0.01   # stopping criterion used in relabeling algorithm
##D 
##D nIter=10
##D burn.in=0
##D step.size=1
##D nResample=2
##D seed.value = 12
##D 
##D data.name="tmp"          # prefix of output files
##D 
##D # Run DIRECT
##D # This is a short run that takes less than a minute
##D # All output files will be under current working directory
##D DIRECT (data=data, data.name=data.name, SKIP=SKIP, nTime=nTime, times=times, 
##D     c.curr=c.curr, PAR.INIT=TRUE, alpha.curr=alpha.curr, 
##D     alpha.prior.shape=alpha.prior.shape, 
##D     alpha.prior.rate=alpha.prior.rate, 
##D     nIter=nIter, burn.in=burn.in, step.size=step.size, 
##D     nResample=nResample, seed.value=seed.value, 
##D     RNORM.METHOD="svd", SAMPLE.C=SAMPLE.C.METHOD, 
##D     PRIOR.MODEL=PRIOR.MODEL, ALPHA.METHOD=ALPHA.METHOD, 
##D     RELABEL.THRESHOLD=RELABEL.THRESHOLD)
##D 
##D # Process MCMC samples from DIRECT
##D data.name="tmp"          # prefix of output files
##D tmp.summary = summaryDIRECT (data.name)
##D 
##D # Plot clustering results
##D # Clustered mean profiles
##D plotClustersMean (data, tmp.summary, SKIP=2, times=times)
##D par (mfrow=c(1,1))
##D # Posterior estimates of standard deviations 
##D # of three types of variability in each cluster
##D plotClustersSD (tmp.summary, nTime=18)
##D # PCA plot of the posterior allocation probability matrix
##D plotClustersPCA (data$GeneName, tmp.summary)
## End(Not run)



