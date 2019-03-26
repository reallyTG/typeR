library(OpenMx)


### Name: mxVersion
### Title: Returns Current Version String
### Aliases: mxVersion

### ** Examples


# Print useful version information.
mxVersion()
# If you just want the version, use this call.
x = mxVersion(verbose=FALSE)

library(OpenMx)
data(demoOneFactor)  # load the demoOneFactor dataframe
manifests <- names(demoOneFactor) # set the manifest to the 5 demo variables
latents   <- c("G")  # define 1 latent variable
model <- mxModel(model = "One Factor", type = "RAM",
    manifestVars = manifests,
    latentVars   = latents,
    mxPath(from = latents, to = manifests, labels = paste("b", 1:5, sep = "")), 
    mxPath(from = manifests, arrows = 2  , labels = paste("u", 1:5, sep = "")), 
    mxPath(from = latents  , arrows = 2  , free = FALSE, values = 1.0), 
    mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
mxVersion(model, verbose = TRUE)




