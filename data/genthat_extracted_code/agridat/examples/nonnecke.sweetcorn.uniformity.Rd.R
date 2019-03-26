library(agridat)


### Name: nonnecke.sweetcorn.uniformity
### Title: Uniformity trial of sweet corn
### Aliases: nonnecke.sweetcorn.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   # Corn 1
##D   data(nonnecke.sweetcorn.uniformity)
##D   dat <- nonnecke.sweetcorn.uniformity
##D 
##D   require(desplot)
##D   desplot(yield~col*row|loc, dat,
##D           flip=TRUE, tick=TRUE, aspect=96/180, # true aspect
##D           main="nonnecke.sweetcorn.uniformity")
##D     
## End(Not run)



