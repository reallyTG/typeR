library(umx)


### Name: RMSEA.summary.mxmodel
### Title: RMSEA function for MxModels
### Aliases: RMSEA.summary.mxmodel

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1.0)
)
RMSEA(m1)



