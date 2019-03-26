library(marmap)


### Name: autoplot.bathy
### Title: Ploting bathymetric data with ggplot
### Aliases: autoplot.bathy

### ** Examples

# load NW Atlantic data and convert to class bathy
	data(nw.atlantic)
	atl <- as.bathy(nw.atlantic)

  # basic plot
## Not run: 
##D     library("ggplot2")
##D 	autoplot(atl)
##D 
##D   # plot images
##D 	autoplot(atl, geom=c("tile"))
##D 	autoplot(atl, geom=c("raster")) # faster but not resolution independant
##D 
##D   # plot both!
##D 	autoplot(atl, geom=c("raster", "contour"))
##D 
##D   # geom names can be abbreviated
##D 	autoplot(atl, geom=c("r", "c"))
##D 
##D   # do not highlight the coastline
##D 	autoplot(atl, coast=FALSE)
##D     
##D   # better colour scale
##D   	autoplot(atl, geom=c("r", "c")) +
##D     scale_fill_gradient2(low="dodgerblue4", mid="gainsboro", high="darkgreen")
##D 
##D   # set aesthetics
##D 	autoplot(atl, geom=c("r", "c"), colour="white", size=0.1)
##D   
##D   # topographical colour scale, see ?scale_fill_etopo
##D 	autoplot(atl, geom=c("r", "c"), colour="white", size=0.1) + scale_fill_etopo()
##D   	
##D 	# add sampling locations
##D 	data(metallo)
##D   last_plot() + geom_point(aes(x=lon, y=lat), data=metallo, alpha=0.5)
##D 
##D   # an alternative contour map making use of additional mappings
##D   # see ?stat_contour in ggplot2 to understand the ..level.. argument
##D 	autoplot(atl, geom="contour", mapping=aes(colour=..level..))
## End(Not run)



