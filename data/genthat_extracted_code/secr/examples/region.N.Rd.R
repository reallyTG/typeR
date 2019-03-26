library(secr)


### Name: region.N
### Title: Population Size
### Aliases: region.N region.N.secr region.N.secrlist 'population size'
### Keywords: models

### ** Examples


region.N(secrdemo.0)

## Not run: 
##D ## a couple more routine examples
##D region.N(secrdemo.CL)
##D region.N(ovenbird.model.D)
##D 
##D ## region defined as vector polygon
##D ## retain and plot region mask
##D temp <- region.N(possum.model.0, possumarea, spacing = 40,
##D     keep.region = TRUE)
##D temp
##D plot (attr(temp, "region"), type = "l")
## End(Not run)




