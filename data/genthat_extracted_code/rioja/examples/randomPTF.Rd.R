library(rioja)


### Name: randomPTF
### Title: Random transfer functions to calculate variable importance
### Aliases: randomPTF plot.randomPTF print.randomPTF
### Keywords: multivariate models

### ** Examples

## Not run: 
##D data(SWAP)
##D result <- randomPTF(SWAP$spec, SWAP$pH, fun=WA)
##D plot(result, cex=0.6)
##D print(result)
##D # parallel version
##D if (.Platform$OS.type=='windows') {
##D   library(doParallel)
##D   registerDoParallel(cores=4)
##D } else {
##D   library(doMC)
##D   registerDoMC(cores=4)
##D }
##D system.time(result <- randomPTF(SWAP$spec, SWAP$pH, fun=WA, do.parallel=TRUE, nTF=5000))
## End(Not run)



