library(OpenMx)


### Name: omxParallelCI
### Title: Calculate confidence intervals without re-doing the primary
###   optimization.
### Aliases: omxParallelCI omxRunCI

### ** Examples

require(OpenMx)
# 1. Build and run a model, don't compute intervals yet
data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")
factorModel <- mxModel("One Factor", type="RAM",
	manifestVars=manifests, 
	latentVars=latents,
	mxPath(from=latents, to=manifests),
 	mxPath(from=manifests, arrows=2),
	mxPath(from=latents, arrows=2, free=FALSE, values=1.0),
	mxData(observed=cov(demoOneFactor), type="cov", numObs=500),
	# Add confidence intervals for (free) params in A and S matrices.
	mxCI(c('A', 'S'))
)
factorRun <- mxRun(factorModel)

# 2. Compute the CIs on factorRun, and view summary
factorCI1 <- omxRunCI(factorRun)
summary(factorCI1)$CI

# 3. Use low-level omxParallelCI interface
factorCI2 <- omxParallelCI(factorRun) 

# 4. Build, but don't run the newly-created model
factorCI3 <- omxParallelCI(factorRun, run= FALSE)  



