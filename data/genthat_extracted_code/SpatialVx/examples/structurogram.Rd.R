library(SpatialVx)


### Name: structurogram
### Title: Structure Function for Non-Gridded Spatial Fields.
### Aliases: structurogram plot.structurogram
### Keywords: math

### ** Examples

data( ozone2)
good<- !is.na(ozone2$y[16,])
x<- ozone2$lon.lat[good,] 
y<- ozone2$y[16,good]
     
look <- structurogram( x,y, N=15, lon.lat=TRUE)
plot(look)
# Compare above with results from example for function vgram from package fields.

look <- structurogram( x,y, N=15, lon.lat=TRUE, q=1)
plot(look)




