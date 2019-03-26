library(umx)


### Name: umx_time
### Title: umx_time
### Aliases: umx_time

### ** Examples

require(umx)
umx_time('start')
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
myData = mxData(cov(demoOneFactor), type = "cov", numObs = 500)
m1 <- umxRAM("One Factor", data = myData,
	umxPath(from = latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
umx_time(m1)
m2 = umxRun(m1)
umx_time(c(m1, m2))
umx_time('stop')
# elapsed time: .3 seconds



