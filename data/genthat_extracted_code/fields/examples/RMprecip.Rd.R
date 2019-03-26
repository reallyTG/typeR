library(fields)


### Name: RMprecip
### Title: Monthly total precipitation (mm) for August 1997 in the Rocky
###   Mountain Region and some gridded 4km elevation data sets (m).
### Aliases: RMprecip RMelevation PRISMelevation
### Keywords: datasets

### ** Examples

# this data set was created  the 
# historical data  taken from 
# Observed monthly precipitation, min and max temperatures for the coterminous US 
# 1895-1997
# NCAR_pinfill 
# see the Geophysical Statistics Project datasets page for the supporting functions 
# and details. 

# plot 
quilt.plot(RMprecip$x, RMprecip$y)
US( add=TRUE, col=2, lty=2)

# comparison of station elevations with PRISM gridded values

data(RMelevation)

interp.surface( RMelevation, RMprecip$x)-> test.elev

plot( RMprecip$elev, test.elev, xlab="Station elevation", 
ylab="Interpolation from PRISM grid")
abline( 0,1,col="blue")

# some differences  with high elevations probably due to complex
# topography!

#
# view of Rockies looking from theSoutheast

save.par<- par(no.readonly=TRUE)

par( mar=c(0,0,0,0))

# fancy use of persp with shading and lighting.
persp( RMelevation, theta=75, phi= 15, 
          box=FALSE, axes=FALSE, xlab="", ylab="", 
         border=NA,
         shade=.95, lphi= 10, ltheta=80,
         col= "wheat4", 
         scale=FALSE, expand=.00025)

# reset graphics parameters and a more conventional image plot.
par( save.par)
image.plot(RMelevation, col=topo.colors(256))
US( add=TRUE, col="grey", lwd=2)
title("PRISM elevations (m)")



