library(OpenMx)


### Name: mxSE
### Title: Compute standard errors in OpenMx
### Aliases: mxSE

### ** Examples

library(OpenMx)
data(demoOneFactor)
# ===============================
# = Make and run a 1-factor CFA =
# ===============================

latents  = c("G") # the latent factor
manifests = names(demoOneFactor) # manifest variables to be modeled
# ===========================
# = Make and run the model! =
# ===========================
m1 <- mxModel("One Factor", type = "RAM", 
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests, labels=paste0('lambda', 1:5)),
	mxPath(from = manifests, arrows = 2),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
m1 = mxRun(m1)
mxSE(lambda5, model = m1)
mxSE(lambda1^2, model = m1)



