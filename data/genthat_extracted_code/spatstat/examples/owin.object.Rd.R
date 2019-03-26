library(spatstat)


### Name: owin.object
### Title: Class owin
### Aliases: owin.object
### Keywords: spatial attribute

### ** Examples

 w <- owin()
 w <- owin(c(0,1), c(0,1))
 # the unit square
  
 w <- owin(c(0,1), c(0,2))
 ## Not run: 
##D  if(FALSE) {
##D    plot(w)
##D    # plots edges of a box 1 unit x 2 units
##D    v <- locator() 
##D    # click on points in the plot window
##D    # to be the vertices of a polygon 
##D    # traversed in anticlockwise order 
##D    u <- owin(c(0,1), c(0,2), poly=v)
##D    plot(u)
##D    # plots polygonal boundary using polygon()
##D    plot(as.mask(u, eps=0.02))
##D    # plots discrete pixel approximation to polygon
##D  }
## End(Not run)



