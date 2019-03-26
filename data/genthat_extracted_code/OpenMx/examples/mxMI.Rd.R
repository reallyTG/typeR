library(OpenMx)


### Name: mxMI
### Title: Estimate Modification Indices for MxModel Objects
### Aliases: mxMI

### ** Examples

# Create a model
require(OpenMx)
data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")
factorModel <- mxModel("One Factor",
      type="RAM",
      manifestVars = manifests,
      latentVars = latents,
      mxPath(from=latents, to=manifests),
      mxPath(from=manifests, arrows=2),
      mxPath(from=latents, arrows=2,
            free=FALSE, values=1.0),
      mxPath(from = 'one', to = manifests),
      mxData(observed=cov(demoOneFactor), type="cov", numObs=500,
             means = colMeans(demoOneFactor)))
#No SEs for speed
factorModel <- mxOption(factorModel, 'Standard Errors', 'No')
factorRun <- mxRun(factorModel)

# See if it should be modified
# Notes
#  Using full=FALSE for faster performance
#  Using matrices= 'A' and 'S' to not get MIs for
#    the F matrix which is always fixed.
fim <- mxMI(factorRun, matrices=c('A', 'S'), full=FALSE)
round(fim$MI, 3)
plot(fim$MI, ylim=c(0, 10))
abline(h=qchisq(p=1-0.01, df=1)) # line of "significance"




