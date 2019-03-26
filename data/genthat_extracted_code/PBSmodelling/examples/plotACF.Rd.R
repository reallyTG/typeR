library(PBSmodelling)


### Name: plotACF
### Title: Plot Autocorrelation Bars From a Data Frame, Matrix, or Vector
### Aliases: plotACF
### Keywords: graphs

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  resetGraph(); plotACF(trees,lwd=2,lags=30)
  par(oldpar)
})



