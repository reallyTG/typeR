library(LatticeKrig)


### Name: LKrig.sim
### Title: Functions for simulating a multiresolution process following the
###   Lattice Krig covariance model.
### Aliases: LKrig.sim LKrig.sim.conditional simConditionalDraw
### Keywords: spatial

### ** Examples

# Load ozone data set
  data(ozone2)  
  x<-ozone2$lon.lat
  y<- ozone2$y[16,]
# Find location that are not 'NA'.
# (LKrig is not set up to handle missing observations.)
  good <-  !is.na( y)
  x<- x[good,]
  y<- y[good]
  LKinfo<- LKrigSetup( x,NC=20,nlevel=1, alpha=1, lambda= .3 , a.wght=5)
# BTW lambda is close to MLE 
# Simulating this  LKrig process
# simulate 4 realizations of process and plot them
# (these have unit marginal variance)
  xg<- make.surface.grid(list( x=seq( -87,-83,,40), y=seq(36.5, 44.5,,40)))
  out<- LKrig.sim(xg, LKinfo,M=4)
## Not run: 
##D   set.panel(2,2)
##D   for( k in 1:4){
##D     image.plot( as.surface( xg, out[,k]), axes=FALSE) }
## End(Not run)
  obj<- LKrig(x,y,LKinfo=LKinfo)
  O3.cond.sim<- LKrig.sim.conditional( obj, M=3,nx=40,ny=40) 
## Not run: 
##D   set.panel( 2,2)
##D   zr<- range( c(  O3.cond.sim$draw,  O3.cond.sim$ghat), na.rm=TRUE)
##D   coltab<- tim.colors()
##D   image.plot( as.surface( O3.cond.sim$x.grid, O3.cond.sim$ghat), zlim=zr)
##D   title("Conditional mean")
##D   US( add=TRUE)
##D   for( k in 1:3){
##D     image( as.surface( O3.cond.sim$x.grid, O3.cond.sim$g.draw[,k]),
##D               zlim=zr, col=coltab)
##D     points( obj$x, cex=.5)
##D     US( add=TRUE)
##D   }
##D   set.panel()
## End(Not run)




