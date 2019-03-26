library(umx)


### Name: umx_is_RAM
### Title: umx_is_RAM
### Aliases: umx_is_RAM

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
umxSummary(m1, show = "std")
if(umx_is_RAM(m1)){
	message("nice RAM model!")
}
if(!umx_is_RAM(m1)){
	message("model must be a RAM model")
}



