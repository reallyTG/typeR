library(umx)


### Name: umx_add_variances
### Title: umx_add_variances
### Aliases: umx_add_variances

### ** Examples

require(umx)
data(demoOneFactor)
m1 <- mxModel("One Factor", type = "RAM",
 manifestVars = names(demoOneFactor),
 latentVars = "g",
	mxPath(from = "g", to = names(demoOneFactor), values= .1),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
umx_show(m1, matrices = "S") # variables lack variance :-(
m1 = umx_add_variances(m1, add.to = names(demoOneFactor))
m1 = umx_add_variances(m1, add.to = "g", FALSE, 1)
umx_show(m1, matrices = "S") 
# Note: latent g has been treated like the manifests...
# umxFixLatents() will take care of this for you...
m1 = umxRun(m1, setLabels = TRUE, setValues = TRUE)
umxSummary(m1)



