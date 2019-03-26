library(umx)


### Name: umx_get_checkpoint
### Title: umx_get_checkpoint
### Aliases: umx_get_checkpoint

### ** Examples

umx_get_checkpoint() # current global default
require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
m1 = umx_set_checkpoint(interval = 2, model = m1)
umx_get_checkpoint(model = m1)



