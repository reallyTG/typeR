library(fields)


### Name: quilt.plot
### Title: Image plot for irregular spatial data.
### Aliases: quilt.plot
### Keywords: hplot

### ** Examples


data( ozone2)
# plot 16 day of ozone data set

quilt.plot( ozone2$lon.lat, ozone2$y[16,])
US( add=TRUE, col="grey", lwd=2)

#
# and ... if you are fussy 
# do it again 
# quilt.plot( ozone2$lon.lat, ozone2$y[16,],add=TRUE)
# to draw over the state boundaries. 
#

### adding a common legend strip "by hand"
## and a custom color table

coltab<- two.colors( 256, middle="grey50" )

par( oma=c( 0,0,0,5)) # save some room for the legend
set.panel(2,2)
zr<- range( ozone2$y, na.rm=TRUE)

for( k in 1:4){
quilt.plot( ozone2$lon.lat, ozone2$y[15+k,], add.legend=FALSE,
 zlim=zr, col=coltab, nx=40, ny=40)
US( add=TRUE)
}
par( oma=c(0,0,0,1))
image.plot(zlim=zr,legend.only=TRUE, col=coltab)
# may have to adjust number of spaces in oma to make this work.
  


