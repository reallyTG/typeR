library(LatticeKrig)


### Name: LKRectangle
### Title: Summary of the LKRectangle geometry for a standard two
###   dimensional spatial domain.
### Aliases: LKRectangle
### Keywords: spatial

### ** Examples

# the grid with only 2 extra boundary points
  sDomain<- cbind( c(-1,1), c( -1, 1))
  LKinfo<- LKrigSetup(sDomain, nlevel=3, NC=4, a.wght=4.1,
           NC.buffer=2, alpha=c(1,.5,.125) )
  LKgrid<- LKinfo$latticeInfo$grid
  plot(   make.surface.grid(LKgrid[[1]]),
                          pch=16, cex=1.5)
  points( make.surface.grid(LKgrid[[2]]), 
                          pch=15, cex=.8, col="red" )
  points( make.surface.grid(LKgrid[[3]]),
                          pch="+", col="green" )
  rect(sDomain[1,1],sDomain[1,2],
     sDomain[2,1],sDomain[2,2], lwd=3 )

# basis functions on a grid
# this function actually evaluates all of them on the grid.
  xg<- make.surface.grid(
        list(x=seq( -2,2,,80), y=seq( -2,2,,80)) )
  out<- LKrig.basis( xg, LKinfo)
# basis functions 20, 26, 100  and 200
  plot(   make.surface.grid( LKgrid[[1]] ) , 
                          pch=16, cex=.5)
  rect(sDomain[1,1],sDomain[1,2],
     sDomain[2,1],sDomain[2,2], lwd=3,border="grey" )
  contour( as.surface(xg, out[,20]), col="red1",
                                     add=TRUE)
  contour( as.surface(xg, out[,36]), col="red4", 
                                     add=TRUE)
  contour( as.surface(xg, out[,100]), col="blue1",
                                     add=TRUE)
  contour( as.surface(xg, out[,200]), col="blue4",
                                      add=TRUE)
  title( "basis functions 20, 26, 100, 200")



