library(fields)


### Name: poly.image
### Title: Image plot for cells that are irregular quadrilaterals.
### Aliases: poly.image poly.image.regrid
### Keywords: spatial

### ** Examples

data(RCMexample)
set.panel( 1,2)
par(pty="s")
# plot with grid modified
poly.image( RCMexample$x, RCMexample$y, RCMexample$z[,,1])

# use midpoints of z
poly.image( RCMexample$x, RCMexample$y, RCMexample$z[,,1],midpoint=TRUE)

  set.panel()
# an example with quantile breaks

 brk<- quantile(  RCMexample$z[,,1], c( 0, .9,.95,.99,1.0) )
 poly.image( RCMexample$x, RCMexample$y, RCMexample$z[,,1], breaks=brk, col=
    rainbow(4))
  

# images are very similar. 
  set.panel()
# Regridding of x and y
  l1<- poly.image.regrid( RCMexample$x)
  l2<- poly.image.regrid( RCMexample$y)

# test that this works
  i<- 1:10
  plot( l1[i,i], l2[i,i])
  points( RCMexample$x[i,i], RCMexample$y[i,i],col="red")

 

  


