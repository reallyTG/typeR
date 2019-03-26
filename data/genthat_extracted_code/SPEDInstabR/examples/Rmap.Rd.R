library(SPEDInstabR)


### Name: Rmap
### Title: RASTER MAP
### Aliases: Rmap
### Keywords: Rmap

### ** Examples

## Not run: 
##D 
##D #Example 1
##D 
##D #If using RWizard, for a better quality of the geographic
##D #coordinates, replace data(adworld) by @_Build_AdWorld_
##D data(adworld)
##D data(VI)
##D Rmap(data=VI, colscale=rev(heat.colors(100)),
##D main= "Percentage of contribution of vegetation index")
##D 
##D #Example 2. Only to be used with RWizard and the map is exported to a jpg
##D 
##D data(VI)
##D @_Build_AdWorld_
##D Rmap(data = VI , Area = c("Argentina", "Bolivia", "Brazil", "Chile", "Colombia",
##D "Ecuador", "French Guiana", "Guyana", "Paraguay", "Peru", "Suriname",
##D "Uruguay", "Venezuela","Panama","Nicaragua","Costa Rica"),
##D main = "Percentage of contribution of vegetation index", jpg=TRUE)
## End(Not run)



