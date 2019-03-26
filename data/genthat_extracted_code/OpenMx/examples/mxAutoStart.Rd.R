library(OpenMx)


### Name: mxAutoStart
### Title: Automatically set starting values for an MxModel
### Aliases: mxAutoStart

### ** Examples

# Use the frontpage model with negative variances to show better
# starting values
library(OpenMx)
data(demoOneFactor)

latents  = c("G") # the latent factor
manifests = names(demoOneFactor) # manifest variables to be modeled

m1 <- mxModel("One Factor", type = "RAM", 
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests),
	mxPath(from = manifests, arrows = 2, values=-.2),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
	mxPath(from = "one", to = manifests),
	mxData(demoOneFactor, type = "raw")
)

# Starting values imply negative variances!
mxGetExpected(m1, 'covariance')

# Use mxAutoStart to get much better starting values
m1s <- mxAutoStart(m1)
mxGetExpected(m1s, 'covariance')



