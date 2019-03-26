library(GEOmap)


### Name: plotGEOmap
### Title: Plot a GEO map
### Aliases: plotGEOmap
### Keywords: hplot

### ** Examples

library(geomapdata)

data(coastmap)

plotGEOmap(coastmap , xaxs='i', yaxs='i')

####################   example:
coastmap$STROKES$col[coastmap$STROKES$code=="C" ] = rgb(1, .6, .6)
coastmap$STROKES$col[coastmap$STROKES$code=="c" ] = rgb(1, .9, .9)
coastmap$STROKES$col[coastmap$STROKES$code=="L" ] = rgb(.6, .6, 1)

plot(c(-30, 370), c(-85, 85), type='n', ann=FALSE,  xaxs='i', yaxs='i')

plotGEOmap(coastmap , border='black' , add=TRUE)
title(xlab="Longitude", ylab="Latitude" )
grid()

box()


## Not run: 
##D 
##D ###  political map of the world
##D library(geomapdata)
##D plotGEOmap(coastmap , border='black' , add=FALSE, xaxs='i')
##D 
##D data(europe.bdy)
##D data(asia.bdy)
##D 
##D data(africa.bdy)
##D data(namer.bdy)
##D 
##D data(samer.bdy)
##D data(USAmap)
##D 
##D 
##D plotGEOmap(europe.bdy ,  add=TRUE)
##D plotGEOmap(asia.bdy ,  add=TRUE)
##D plotGEOmap(africa.bdy ,  add=TRUE)
##D plotGEOmap(namer.bdy ,  add=TRUE)
##D 
##D plotGEOmap(samer.bdy ,  add=TRUE)
##D 
##D plotGEOmap(USAmap ,  add=TRUE)
##D 
##D 
##D 
## End(Not run)





