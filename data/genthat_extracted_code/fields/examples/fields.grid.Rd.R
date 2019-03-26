library(fields)


### Name: fields.grid
### Title: Using MKrig for predicting on a grid.
### Aliases: mKrig.grid
### Keywords: hplot

### ** Examples

x<- RMprecip$x
y<- RMprecip$y

Tps( x,y)-> obj

# make up an 80X80 grid that has ranges of observations
# use same coordinate names as the x matrix

glist<- fields.x.to.grid(x, nx=80, ny=80) # this is a cute way to get a default grid that covers x

# convert grid list to actual x and y values ( try plot( Bigx, pch="."))
    make.surface.grid(glist)-> Bigx 

# include actual x locations along with grid. 
    Bigx<- rbind( x, Bigx)

# evaluate the surface on this set of points (exactly)

    predict(obj, x= Bigx)-> Bigy

# set the range for the compact covariance function 
# this will involve  less than 20 nearest neighbors that have
# nonzero covariance
# 

     V<- diag(c( 2.5*(glist$lon[2]-glist$lon[1]), 
                 2.5*(glist$lat[2]-glist$lat[1])))
## Not run: 
##D # this is an interplotation of the values using a compact 
##D # but thin plate spline like covariance. 
##D     mKrig( Bigx,Bigy, cov.function="wendland.cov",k=4, V=V, 
##D                  lambda=0)->out2 
##D # the big evaluation this takes about 45 seconds on a Mac G4 latop
##D     predictSurface( out2, nx=400, ny=400)-> look
## End(Not run)

# the nice surface
## Not run: 
##D     
##D     surface( look)
##D     US( add=TRUE, col="white")
## End(Not run)




