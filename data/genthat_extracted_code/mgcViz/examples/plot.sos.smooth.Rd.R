library(mgcViz)


### Name: plot.sos.smooth
### Title: Plotting smooths on the sphere
### Aliases: plot.sos.smooth

### ** Examples

## Not run: 
##D library(mgcViz)
##D set.seed(0)
##D n <- 400
##D 
##D f <- function(la,lo) { ## a test function...
##D   sin(lo)*cos(la-.3)
##D }
##D 
##D ## generate with uniform density on sphere...  
##D lo <- runif(n)*2*pi-pi ## longitude
##D la <- runif(3*n)*pi-pi/2
##D ind <- runif(3*n)<=cos(la)
##D la <- la[ind];
##D la <- la[1:n]
##D 
##D ff <- f(la,lo)
##D y <- ff + rnorm(n)*.2 ## test data
##D 
##D ## generate data for plotting truth...
##D lam <- seq(-pi/2,pi/2,length=30)
##D lom <- seq(-pi,pi,length=60)
##D gr <- expand.grid(la=lam,lo=lom)
##D fz <- f(gr$la,gr$lo)
##D zm <- matrix(fz,30,60)
##D 
##D require(mgcv)
##D dat <- data.frame(la = la *180/pi,lo = lo *180/pi,y=y)
##D 
##D ## fit spline on sphere model...
##D bp <- gamV(y~s(la,lo,bs="sos",k=60),data=dat)
##D 
##D # Plot on sphere
##D plot(sm(bp, 1), scheme=0) + l_fitRaster() + l_fitContour() + 
##D    l_points(shape = 19) + l_rug() + l_coordContour() + l_bound() 
##D  
##D # Plotting as in standard 2D plots
##D plot(sm(bp, 1), scheme=1) + l_fitRaster() + l_fitContour() + 
##D            l_points(shape = 19) + l_rug()
## End(Not run)



