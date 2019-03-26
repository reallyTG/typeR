library(marmap)


### Name: hawaii
### Title: Bathymetric data for Hawaii, USA
### Aliases: hawaii hawaii.sites

### ** Examples

# load hawaii data
	data(hawaii)
	data(hawaii.sites)

# class "bathy"
	class(hawaii)
	summary(hawaii)

## Not run: 
##D ## use of plot.bathy to produce a bathymetric map
##D # creation of a color palette
##D 	pal <- colorRampPalette(c("black","darkblue","blue","lightblue"))
##D 
##D # Plotting the bathymetry
##D 	plot(hawaii,image=TRUE,draw=TRUE,bpal=pal(100),asp=1,col="grey40",lwd=.7)
##D 
##D # Adding coastline
##D 	require(mapdata)
##D 	map("worldHires",res=0,fill=TRUE,col=rgb(.8,.95,.8,.7),add=TRUE)
##D 
##D # Adding hawaii.sites location on the map
##D 	points(hawaii.sites,pch=21,col="yellow",bg=col2alpha("yellow",.9),cex=1.2)
## End(Not run)



