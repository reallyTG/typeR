library(umx)


### Name: umx_drop_ok
### Title: umx_drop_ok
### Aliases: umx_drop_ok

### ** Examples

require(umx)
data(demoOneFactor)
latents   = c("g")
manifests = names(demoOneFactor)
myData    = mxData(cov(demoOneFactor), type = "cov", numObs = 500)
m1 <- umxRAM("OneFactor", data = myData,
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
m2 = umxModify(m1, update = "g_to_x1", name = "no effect on x1")
umx_drop_ok(m1, m2, text = "the path to x1")



