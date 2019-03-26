library(umx)


### Name: umxSummary.MxModel
### Title: Shows a compact, publication-style, summary of a RAM model
### Aliases: umxSummary.MxModel

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
umxSummary(m1, showEstimates = "std")
# output as latex
umx_set_table_format("latex")
umxSummary(m1, showEstimates = "std")
umx_set_table_format("markdown")
# output as raw
umxSummary(m1, show = "raw")
m1 <- mxModel(m1,
  mxData(demoOneFactor[1:100,], type = "raw"),
  umxPath(mean = manifests),
  umxPath(mean = latents, fixedAt = 0)
)
m1 <- mxRun(m1)
umxSummary(m1, showEstimates = "std", filter = "NS")



