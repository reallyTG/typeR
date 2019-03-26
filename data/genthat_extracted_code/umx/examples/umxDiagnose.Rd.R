library(umx)


### Name: umxDiagnose
### Title: Diagnose problems in a model - this is a work in progress.
### Aliases: umxDiagnose

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
myData = mxData(cov(demoOneFactor), type = "cov", numObs = 500)
m1 <- umxRAM("OneFactor", data = myData,
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
m1 = mxRun(m1)
umxSummary(m1, show = "std")
umxDiagnose(m1)



