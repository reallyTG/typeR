library(recmap)


### Name: as.recmap.SpatialPolygonsDataFrame
### Title: Convert a SpatialPolygonsDataFrame Object to recmap Object
### Aliases: as.recmap.SpatialPolygonsDataFrame as.recmap sp2recmap

### ** Examples


  SpDf <- as.SpatialPolygonsDataFrame(recmap(checkerboard(8)))

  summary(SpDf)
  spplot(SpDf)

  summary(as.recmap(SpDf))



  # taken from https://github.com/sjewo/cartogram
	
	## Not run: 
##D      if (requireNamespace("maptools", quietly = TRUE)) {
##D 	library(maptools)
##D         data(wrld_simpl)
##D 
##D 	afr <- as.recmap(wrld_simpl[wrld_simpl$REGION==2, ])
##D 	is.recmap(afr)
##D 
##D 	afr$z <- afr$POP2005 
##D 
##D 	is.recmap(afr)
##D 	afr <- afr[afr$z > 0, ]
##D 
##D 	# make map overlap to generate a connected pseudo dual
##D 	afr$dx <- 2.0 * afr$dx
##D 	afr$dy <- 2.0 * afr$dy
##D 
##D 
##D 	# overview
##D 	plot(recmap(afr))
##D 
##D 	# use the GA
##D 	set.seed(1)
##D 	plot(recmapGA(afr))
##D 
##D      }
##D 	
## End(Not run)



