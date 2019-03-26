library(umx)


### Name: umx_show
### Title: umx_show
### Aliases: umx_show

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
m1 = umxRun(m1, setLabels = TRUE, setValues = TRUE)
umx_show(m1)
umx_show(m1, digits = 3)
umx_show(m1, matrices = "S")
umx_show(m1, what = "free")
umx_show(m1, what = "labels")
umx_show(m1, what = "free", matrices = "A")



