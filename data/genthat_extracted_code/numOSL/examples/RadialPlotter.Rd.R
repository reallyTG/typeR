library(numOSL)


### Name: RadialPlotter
### Title: Statistical age model optimization (with a Maximum Likelihood
###   Estimation method)
### Aliases: RadialPlotter RadialPlotter.default
### Keywords: statistical age models radial plot equivalent dose Central
###   Age Model Finite Mixture Age Model Minimum Age Model

### ** Examples

  data(EDdata)
  # Find out the appropriate number of components 
  # in FMM and fit automatically.
  RadialPlotter(EDdata$al3,zscale=seq(24,93,7))

  # Fit MAM3 (not run). 
  # RadialPlotter(EDdata$gl11,ncomp=-1,zscale=seq(20,37,3))



