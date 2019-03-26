library(RPMG)


### Name: aGETXprofile
### Title: Cross sectional profile through a digital elevation map
### Aliases: aGETXprofile
### Keywords: iplot

### ** Examples

## Not run: 
##D #######  get data 
##D    data(volcano)
##D ####  extract dimensions of image
##D    nx = dim(volcano)[1]
##D    ny = dim(volcano)[2]
##D 
##D ###  establish units of image
##D    jx = 10*seq(from=0, to=nx-1)
##D    jy = 10*seq(from=0, to=ny-1)
##D 
##D ####  set a letter for the cross section
##D    LAB = LETTERS[1]
##D 
##D ###  coordinates of cross section on image
##D ###  this is normally set by using the locator() function
##D    x1 = 76.47351
##D    y1 = 231.89055
##D    x2 = 739.99746
##D    y2 = 464.08185
##D 
##D ## extract and plot cross section
##D 
##D  aGETXprofile(jx, jy, volcano, myloc=list(x=c(x1, x2), y=c(y1, y2)), LAB=LAB, PLOT=TRUE)
## End(Not run)            



