library(raster)


### Name: hillShade
### Title: Hill shading
### Aliases: hillShade
### Keywords: spatial

### ** Examples

## Not run: 
##D alt <- getData('alt', country='CHE')
##D slope <- terrain(alt, opt='slope')
##D aspect <- terrain(alt, opt='aspect')
##D hill <- hillShade(slope, aspect, 40, 270)
##D plot(hill, col=grey(0:100/100), legend=FALSE, main='Switzerland')
##D plot(alt, col=rainbow(25, alpha=0.35), add=TRUE)
## End(Not run)



