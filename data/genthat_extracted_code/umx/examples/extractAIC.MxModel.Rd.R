library(umx)


### Name: extractAIC.MxModel
### Title: Extract AIC from MxModel
### Aliases: extractAIC.MxModel

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
extractAIC(m1)
# -2.615998
AIC(m1)



