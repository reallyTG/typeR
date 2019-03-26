library(OpenMx)


### Name: mxParametricBootstrap
### Title: Assess whether potential parameters should be freed using
###   parametric bootstrap
### Aliases: mxParametricBootstrap

### ** Examples

library(OpenMx)

data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")

base <- mxModel(
  "OneFactorCov", type="RAM",
  manifestVars = manifests,
  latentVars = latents,
  mxPath(from=latents, to=manifests, values=0,  free=FALSE, labels=paste0('l',1:length(manifests))),
  mxPath(from=manifests, arrows=2, values=rlnorm(length(manifests)), lbound=.01),
  mxPath(from=latents, arrows=2, free=FALSE, values=1.0),
  mxPath(from = 'one', to = manifests, values=0, free=TRUE, labels=paste0('m',1:length(manifests))),
  mxData(demoOneFactor, type="raw"))

base <- mxRun(base)

# use more replications, 8 is for demonstration purpose only
mxParametricBootstrap(base, paste0('l', 1:length(manifests)),
                      "two.sided", replications=8)



