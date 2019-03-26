library(MplusAutomation)


### Name: mplus.traceplot
### Title: Plot the samples for each MCMC chain as a function of iterations
### Aliases: mplus.traceplot
### Keywords: interface

### ** Examples

## Not run: 
##D   myModel <- readModels("BayesModel_WithGH5MCMC.out")
##D   mplus.traceplot(myModel, rows=2, cols=3)
##D 
##D   #alternative using the coda package
##D   library(coda)
##D   plot(myModel$bparameters$valid_draw)
## End(Not run)



