library(mgcViz)


### Name: plotDiff.sos.smooth
### Title: Plotting differences between two smooths on the sphere
### Aliases: plotDiff.sos.smooth

### ** Examples

## Not run: 
##D #### 1) Simulate data and add factors uncorrelated to the response
##D library(mgcViz)
##D set.seed(0)
##D n <- 500
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
##D dat <- data.frame(la = la *180/pi,lo = lo *180/pi,y=y)
##D dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) ) 
##D 
##D #### 2) fit spline on sphere model...
##D bp <- gam(y~s(la,lo,bs="sos",k=60, by = fac),data=dat)
##D bp <- getViz(bp)
##D 
##D # Extract the smooths correspoding to "A1" and "A3" and plot their difference
##D # Using scheme = 0 
##D pl0 <- plotDiff(s1 = sm(bp, 1), s2 = sm(bp, 3))
##D pl0 + l_fitRaster() + l_fitContour() + l_coordContour() + l_bound()
##D 
##D # Plot p-values for significance of differences
##D pl0 + l_pvRaster() + l_pvContour(breaks=c(0.05, 0.1, 0.2, 0.3, 0.5))
##D 
##D # Using scheme = 1
##D pl1 <- plotDiff(s1 = sm(bp, 1), s2 = sm(bp, 2), scheme = 1) 
##D pl1 + l_fitRaster() + l_fitContour()
##D 
##D # Plot p-values for significance of differences
##D pl1 + l_pvRaster() + l_pvContour(breaks=c(0.05, 0.1, 0.2, 0.3, 0.5))
## End(Not run)



