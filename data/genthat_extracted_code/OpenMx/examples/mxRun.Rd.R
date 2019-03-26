library(OpenMx)


### Name: mxRun
### Title: Send a Model to the Optimizer
### Aliases: mxRun

### ** Examples

# Create and run the 1-factor CFA on the openmx.ssri.psu.edu front page

# 1. Load OpenMx and the demoOneFactor dataframe

library(OpenMx)
data(demoOneFactor)  

# 2. Define the manifests (5 demo variables) and latents for use in the model

manifests <- names(demoOneFactor) 
latents   <- c("G")

# 3. Build the model, adding paths and data
model <- mxModel(model="One Factor", type="RAM",
    manifestVars = manifests,
    latentVars   = latents,
    mxPath(from=latents, to=manifests, labels=paste("b", 1:5, sep="")),
    mxPath(from=manifests, arrows=2, labels=paste("u", 1:5, sep="")),
    mxPath(from=latents  , arrows=2, free=FALSE, values=1.0),
    mxData(cov(demoOneFactor), type="cov", numObs=500)
)

# 4. Run the model, returning the result into model
model <- mxRun(model) 

# 5. Show a summary of the fitted model and parameter values
summary(model) 




