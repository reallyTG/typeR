library(umx)


### Name: umx_standardize_RAM
### Title: Return a standardized version of a Structural Model
### Aliases: umx_standardize_RAM

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
m1 = umx_standardize_RAM(m1, return = "model")
m1 = umx_standardize(m1, return = "model")
summary(m1)



