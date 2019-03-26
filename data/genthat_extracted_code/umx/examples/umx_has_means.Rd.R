library(umx)


### Name: umx_has_means
### Title: umx_has_means
### Aliases: umx_has_means

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- mxModel("One Factor", type = "RAM", 
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests),
	mxPath(from = manifests, arrows = 2),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
umx_has_means(m1)
m1 <- mxModel(m1,
	mxPath(from = "one", to = manifests),
	mxData(demoOneFactor[1:100,], type = "raw")
)
umx_has_means(m1)
m1 = umxRun(m1, setLabels = TRUE, setValues = TRUE)
umx_has_means(m1)



