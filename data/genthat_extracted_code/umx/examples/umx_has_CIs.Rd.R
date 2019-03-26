library(umx)


### Name: umx_has_CIs
### Title: umx_has_CIs
### Aliases: umx_has_CIs

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
umx_has_CIs(m1) # FALSE: no CIs and no output
m1 = mxModel(m1, mxCI("G_to_x1"))
umx_has_CIs(m1, check = "intervals") # TRUE intervals set
umx_has_CIs(m1, check = "output")  # FALSE not yet run
m1 = mxRun(m1)
umx_has_CIs(m1, check = "output")  # Still FALSE: Set and Run
m1 = mxRun(m1, intervals = TRUE)
umx_has_CIs(m1, check = "output")  # TRUE: Set, and Run with intervals = T



