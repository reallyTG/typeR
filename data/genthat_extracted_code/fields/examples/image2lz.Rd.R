library(fields)


### Name: image2lz
### Title: Some simple functions for subsetting images
### Aliases: image2lz crop.image in.poly in.poly.grid half.image
###   get.rectangle average.image which.max.matrix which.max.image
### Keywords: hplot

### ** Examples

data(RMelevation)

# region defining Colorado Front Range

  loc<- rbind( c(-106.5, 40.8),
             c(-103.9, 37.5))

# extract elevations for just CO frontrange.
   FR<- crop.image(RMelevation, loc)
   image.plot( FR, col=terrain.colors(256))
   
   which.max.image( FR)

# average cells  4 to 1 by doing this twice!
   temp<-  half.image( RMelevation)
   temp<- half.image( temp)

# or in one step
   temp<-  average.image( RMelevation, Q=4)-> temp
   image.plot( temp, col=terrain.colors(256))

# a polygon (no special meaning entered with just locator)
x1p<- c(
 -106.2017, -104.2418, -102.9182, -102.8163, -102.8927, -103.3254, -104.7763,
 -106.5581, -108.2889, -109.1035, -109.3325, -108.7980)

x2p<- c(
  43.02978, 42.80732, 41.89727, 40.84566, 39.81427, 38.17618, 36.53810, 36.29542,
  36.90211, 38.29752, 39.45025, 41.02767)
xp<- cbind( x1p,x2p)

 image.plot( temp)
 polygon( xp[,1], xp[,2], lwd=2)

# find all grid points inside poly
 fullset<- make.surface.grid( list( x= temp$x, y= temp$y))
 ind<-  in.poly( fullset,xp)

# take a look 
 plot( fullset, pch=".")
 polygon( xp[,1], xp[,2], lwd=2)
 points( fullset[ind,], pch="o", col="red", cex=.5)

# masking out the image NA == white in the image plot
 temp$z[!ind] <- NA
 image.plot( temp)
 polygon( xp[,1], xp[,2], lwd=2)

# This is more efficient for large grids:
# because the large number of grid location ( xg above) is 
# never explicitly created.

 ind<- in.poly.grid( list( x= temp$x, y= temp$y), xp)

# now use ind in the same way as above to mask points outside of polygon




