library(spatstat)


### Name: owin
### Title: Create a Window
### Aliases: owin
### Keywords: spatial datagen

### ** Examples

  w <- owin()
  w <- owin(c(0,1), c(0,1))
  # the unit square

  w <- owin(c(10,20), c(10,30), unitname=c("foot","feet"))
  # a rectangle of dimensions 10 x 20 feet
  # with lower left corner at (10,10)

  # polygon (diamond shape)
  w <- owin(poly=list(x=c(0.5,1,0.5,0),y=c(0,1,2,1)))
  w <- owin(c(0,1), c(0,2), poly=list(x=c(0.5,1,0.5,0),y=c(0,1,2,1)))

  # polygon with hole
  ho <- owin(poly=list(list(x=c(0,1,1,0), y=c(0,0,1,1)),
                       list(x=c(0.6,0.4,0.4,0.6), y=c(0.2,0.2,0.4,0.4))))
  
  w <- owin(c(-1,1), c(-1,1), mask=matrix(TRUE, 100,100))
          # 100 x 100 image, all TRUE
  X <- raster.x(w)
  Y <- raster.y(w)
  wm <- owin(w$xrange, w$yrange, mask=(X^2 + Y^2 <= 1))
          # discrete approximation to the unit disc

  ## Not run: 
##D   if(FALSE) {
##D     plot(c(0,1),c(0,1),type="n")
##D     bdry <- locator()
##D     # click the vertices of a polygon (anticlockwise)
##D   }
##D   
## End(Not run)
  ## Don't show: 
  bdry <- list(x=c(0.1,0.3,0.7,0.4,0.2),
               y=c(0.1,0.1,0.5,0.7,0.3))
  
## End(Don't show)
  w <- owin(poly=bdry)
  ## Not run: plot(w)
 
 ## Not run: 
##D  im <- as.logical(matrix(scan("myfile"), nrow=128, ncol=128))
##D  # read in an arbitrary 128 x 128 digital image from text file
##D  rim <- im[, 128:1]
##D  # Assuming it was given in row-major order in the file
##D  # i.e. scanning left-to-right in rows from top-to-bottom,
##D  # the use of matrix() has effectively transposed rows & columns,
##D  # so to convert it to our format just reverse the column order.
##D  w <- owin(mask=rim)
##D  plot(w)
##D  # display it to check!
##D  
## End(Not run)



