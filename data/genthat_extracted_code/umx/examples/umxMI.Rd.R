library(umx)


### Name: umxMI
### Title: Report modifications which would improve fit.
### Aliases: umxMI

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)[1:3]
df = mxData(cov(demoOneFactor[,manifests]), type = "cov", numObs = 500)
m1 <- umxRAM("One Factor", data = df,
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
umxMI(m1, full=FALSE)



