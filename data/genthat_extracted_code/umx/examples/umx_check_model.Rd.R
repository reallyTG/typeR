library(umx)


### Name: umx_check_model
### Title: Check for required features in an OpenMx.
### Aliases: umx_check_model

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
umx_check_model(m1)
umx_check_model(m1, type = "RAM") # equivalent to umx_is_RAM()
umx_check_model(m1, hasData = TRUE)
## Not run: 
##D umx_check_model(m1, hasMeans = TRUE)
##D umx_check_model(m1, beenRun = FALSE)
## End(Not run)



