library(adehabitatLT)


### Name: ltraj2spdf
### Title: Conversion of the class "ltraj" to the package "sp"
### Aliases: ltraj2spdf ltraj2sldf
### Keywords: hplot

### ** Examples

## Not run: 
##D if (require(sp)) {
##D 
##D 
##D 
##D #########################################
##D ##
##D ## Conversion ltraj -> SpatialPointsDataFrame
##D ##
##D 
##D data(puechcirc)
##D plot(puechcirc)
##D 
##D toto <- ltraj2spdf(puechcirc)
##D plot(toto)
##D 
##D 
##D 
##D #########################################
##D ##
##D ## Conversion ltraj -> SpatialLinesDataFrame
##D ##
##D 
##D toto <- ltraj2sldf(puechcirc)
##D plot(toto)
##D 
##D 
##D }
## End(Not run)



