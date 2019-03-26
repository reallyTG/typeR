library(XMRF)


### Name: XMRF-package
### Title: A R Package to Fit Markov Networks to High-throughput Genomics
###   Data
### Aliases: XMRF-package XMRF-package
### Keywords: package

### ** Examples

	library(XMRF)
	
	n = 100
	p = 20
	sim <- XMRF.Sim(n=n, p=p, model="LPGM", graph.type="scale-free")
	simDat <- sim$X
	
	# Compute the optimal lambda
	lmax = lambdaMax(t(simDat))
	lambda = 0.01* sqrt(log(p)/n) * lmax
	# Run LPGM
	lpgm.fit <- XMRF(simDat, method="LPGM", N=10, lambda.path=lambda, parallel=FALSE)
	
	# Print the fitted Markov networks
	lpgm.fit
	
	ml = plotNet(sim$B)
	ml = plot(lpgm.fit, mylayout=ml)
	


