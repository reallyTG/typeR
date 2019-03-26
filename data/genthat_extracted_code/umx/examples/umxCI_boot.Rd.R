library(umx)


### Name: umxCI_boot
### Title: umxCI_boot
### Aliases: umxCI_boot

### ** Examples

## Not run: 
##D 	require(umx)
##D 	data(demoOneFactor)
##D 	latents  = c("G")
##D 	manifests = names(demoOneFactor)
##D 	m1 <- mxModel("One Factor", type = "RAM", 
##D 		manifestVars = manifests, latentVars = latents, 
##D 		mxPath(from = latents, to = manifests),
##D 		mxPath(from = manifests, arrows = 2),
##D 		mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
##D 		mxData(cov(demoOneFactor), type = "cov", numObs = 500)
##D 	)
##D 	m1 = umxRun(m1, setLabels = TRUE, setValues = TRUE)
##D 	umxCI_boot(m1, type = "par.expected")
## End(Not run)



