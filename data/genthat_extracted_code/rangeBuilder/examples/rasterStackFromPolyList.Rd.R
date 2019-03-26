library(rangeBuilder)


### Name: rasterStackFromPolyList
### Title: Polygon List to rasterStack
### Aliases: rasterStackFromPolyList

### ** Examples


## Not run: 
##D data(crotalus)
##D 
##D # standardize species names
##D crotalus$genSp <- synonymMatch(crotalus$genSp, db='squam')
##D 
##D # get 10 species occurrence sets
##D uniqueSp <- unique(crotalus$genSp)[1:10]
##D uniqueSp <- uniqueSp[complete.cases(uniqueSp)]
##D 
##D # create range polygons
##D ranges <- vector('list', length = length(uniqueSp))
##D for (i in 1:length(uniqueSp)) {
##D 	x <- crotalus[which(crotalus$genSp == uniqueSp[i]),]
##D 
##D 	ranges[[i]] <- getDynamicAlphaHull(x, coordHeaders = c('decimallongitude', 
##D 		'decimallatitude'), clipToCoast = 'terrestrial')
##D }
##D 
##D # name the polygons
##D names(ranges) <- uniqueSp
##D 
##D # keep only the polygons
##D ranges <- lapply(ranges, function(x) x[[1]])
##D 
##D # Create a rasterStack with the extent inferred from the polygons, and a cell
##D # resolution of 0.2 degrees.
##D # cells with the presence of a species get a value of 1, NA if absent. 
##D 
##D rangeStack <- rasterStackFromPolyList(ranges, resolution = 0.2)
##D 
##D # calculate species richness per cell, where cell values are counts of species
##D richnessRaster <- calc(rangeStack, fun=sum, na.rm = TRUE)
##D 
##D # set values of 0 to NA
##D richnessRaster[richnessRaster == 0] <- NA
##D 
##D #plot
##D ramp <- colorRampPalette(c('blue','yellow','red'))
##D plot(richnessRaster, col=ramp(100))
##D 
##D plot(gshhs, add = TRUE, lwd=0.5)
##D 
## End(Not run)



