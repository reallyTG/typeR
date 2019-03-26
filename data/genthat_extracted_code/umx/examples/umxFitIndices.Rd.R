library(umx)


### Name: umxFitIndices
### Title: Get additional fit-indices for a model with umxFitIndices
### Aliases: umxFitIndices

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor",
	data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
umxFitIndices(m1)
# And with raw data
m1 <- umxRAM("m1", data = demoOneFactor,
	umxPath(latents, to = manifests),
	umxPath(v.m. = manifests),
	umxPath(v1m0 = latents)
)
umxFitIndices(m1)
umxAPA(umxFitIndices(m1), digits = 3)



