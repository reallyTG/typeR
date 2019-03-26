library(aroma.affymetrix)


### Name: writeImage.AffymetrixCelFile
### Title: Writes a spatial image of the signals in the CEL file
### Aliases: writeImage.AffymetrixCelFile AffymetrixCelFile.writeImage
###   writeImage,AffymetrixCelFile-method
### Keywords: internal methods IO

### ** Examples
## Not run: 
##D   yellow.colors <- function(n) { hsv(h=0.15, v=0:(n-1)/(n-1)) }
##D   df <- ds[[1]]
##D   writeImage(df, tags="gray", palette=gray.colors(256), xrange=c(0,200))
##D   writeImage(df, tags="yellow", palette=yellow.colors(256), xrange=c(0,200))
##D   writeImage(df, tags="heat", palette=heat.colors(256), xrange=c(0,200))
##D   writeImage(df, tags="terrain", palette=terrain.colors(256), xrange=c(0,200))
##D   writeImage(df, tags="topo", palette=topo.colors(256), xrange=c(0,200))
##D   writeImage(df, tags="cm", palette=cm.colors(256), xrange=c(0,200))
##D   writeImage(df, tags="rainbow", palette=rainbow(256), xrange=c(0,200))
## End(Not run)


