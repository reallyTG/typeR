library(OpenMx)


### Name: OpenMx
### Title: OpenMx: An package for Structural Equation Modeling and Matrix
###   Algebra Optimization
### Aliases: OpenMx OpenMx-package

### ** Examples

library(OpenMx)
data(demoOneFactor)
# ===============================
# = Make and run a 1-factor CFA =
# ===============================

latents  = c("G") # the latent factor
manifests = names(demoOneFactor) # manifest variables to be modeled
# ====================
# = Make the MxModel =
# ====================
m1 <- mxModel("One Factor", type = "RAM", 
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests),
	mxPath(from = manifests, arrows = 2),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)

# ===============================
# = mxRun it and get a summary! =
# ===============================

m1 = mxRun(m1)
summary(m1)




