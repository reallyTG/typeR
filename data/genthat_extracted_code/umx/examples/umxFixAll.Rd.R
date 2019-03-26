library(umx)


### Name: umxFixAll
### Title: umxFixAll: Fix all free parameters
### Aliases: umxFixAll

### ** Examples

require(umx)
data(demoOneFactor)
latents = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("OneFactor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
m2 = umxFixAll(m1, run = TRUE, verbose = TRUE)
mxCompare(m1, m2)



