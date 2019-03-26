library(OpenMx)


### Name: mxGetExpected
### Title: Extract the component from a model's expectation
### Aliases: mxGetExpected imxGetExpectationComponent

### ** Examples

   
#----------
require(OpenMx)
manifests <- paste("x", 1:5, sep="")
latents <- c("G")
factorModel <- mxModel("One Factor",
      type="RAM",
      manifestVars = manifests,
      latentVars = latents,
      mxPath(from=latents, to=manifests),
      mxPath(from=manifests, arrows=2),
      mxPath(from=latents, arrows=2,
            free=FALSE, values=1.0),
      mxPath(from = 'one', to = manifests))

mxGetExpected(factorModel, "covariance")
# oops.  Starting values indicate a zero covariance matrix.
#  Probably should adjust them.




