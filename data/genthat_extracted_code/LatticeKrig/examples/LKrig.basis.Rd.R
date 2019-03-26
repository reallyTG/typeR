library(LatticeKrig)


### Name: LKrig.basis
### Title: Functions for generating a multiresolution, compactly supported
###   basis, multiresolution covariance functions and simulating from these
###   processes.
### Aliases: LKrig.basis LKrig.precision LKrig.cov LKrig.cov.plot
###   LKrig.quadraticform LKrig.spind2spam LKrigCovWeightedObs
###   LKrigMarginalVariance
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

# What does the  LatticeKrig covariance function look like?
# set up LKinfo object
# NC=10 sets the grid for the first level of basis functions
# NC^2 = 100 grid points in first level if square domain.
# given four levels the number of basis functions
# = 10^2 + 19^2 +37^2 + 73^2 = 5329
# effective range scales as roughly kappa where a.wght =  4 + kappa^2    
# or exponential decreasing marginal variances for the components.
    NC<- 10 
    nlevel <- 4
    a.wght <-  4 + 1/(.5)^2
    alpha<-  1/2^(0:(nlevel-1)) 
    LKinfo2<- LKrigSetup( cbind( c( -1,1), c(-1,1)), NC=NC,
                   nlevel=nlevel, a.wght=a.wght,alpha=alpha)
# evaluate covariance  along the  horizontal line through
# midpoint of region -- (0,0) in this case. 
    look<- LKrig.cov.plot( LKinfo2)
# a plot of the covariance function in x and y with respect to (0,0)
    set.panel(2,1)  
    plot(look$u[,1], look$cov[,1], type="l")
    title("X transect")
    plot(look$u[,2], look$cov[,2], type="l")
    title("Y transect")
    set.panel(1,1)
#
#
## Not run: 
##D # full 2-d view of the covariance (this example follows the code
##D # in LKrig.cov.plot)
##D  x2<- cbind( 0,0)
##D  x1<- make.surface.grid( list(x=seq( -1,1,,40),  y=seq( -1,1,,40)))
##D  look<- LKrig.cov( x1,x2, LKinfo2)
##D  contour( as.surface( x1, look))
##D # Note nearly circular contours.
##D # of  course  plot(look[,80/2]) should look like plot above.
##D #
## End(Not run)

## Not run: 
##D #Some correlation functions from different models
##D set.panel(2,1)
##D # a selection of ranges:
##D   hold<- matrix( NA, nrow=150, ncol=4)
##D   kappa<- seq( .25,1,,4)
##D   x2<- cbind( 0,0)
##D   x1<-  cbind( seq(-1,1,,150), rep( 0,150))
##D   for( k in 1:4){
##D     LKtemp<-  LKrigSetup( cbind( c( -1,1), c(-1,1)), NC=NC,
##D                    nlevel=nlevel,
##D                    a.wght= 4  + 1/(kappa[k]^2),
##D                    alpha=alpha)
##D     hold[,k]<-  LKrig.cov( x1,x2, LKinfo=LKtemp)
##D   }
##D   matplot( x1[,1], hold, type="l", lty=1, col=rainbow(5), pch=16 )
##D # a selection of smoothness parameters
##D   ktemp<- .5 # fix range
##D   alpha.power<- seq( 1,4,,4)
##D   LKtemp<- LKinfo2
##D   for( k in 1:4){
##D    LKtemp<-  LKrigSetup( cbind( c( -1,1), c(-1,1)), NC=NC,
##D                    nlevel=nlevel,
##D                    a.wght= 4  + 1/(ktemp^2),
##D                    alpha=alpha^alpha.power[k])
##D     hold[,k]<-  LKrig.cov( x1,x2, LKinfo=LKtemp)
##D   }
##D   matplot( x1[,1], hold, type="l", lty=1, col=rainbow(5) )
##D  set.panel()
## End(Not run)
 
## Not run: 
##D # generating a basis on the domain [-1,1] by [-1,1] with 1 level
##D # Default number of buffer points are added to each side. 
##D   LKinfo<- LKrigSetup(cbind( c(-1,1), c(-1,1)), NC=6,
##D                                  nlevel=1, a.wght=4.5,alpha=1, NC.buffer=0 )
##D # evaluate the basis functions on a grid to look at them
##D   xg<- make.surface.grid( list(x=seq(-1,1,,50), y= seq(-1,1,,50)))
##D   PHI<- LKrig.basis( xg,LKinfo)
##D   dim(PHI) # should be  2500=50^2  by  36=6^2
##D # plot the 9th basis function  as.surface is a handy function to
##D # reformat the vector as an image object
##D # using the grid information in an attribute of the grid points
##D   set.panel(1,3) 
##D   image.plot(as.surface(xg, PHI[,9]))
##D   points(  make.surface.grid( LKrigLatticeCenters(LKinfo, 1)) , col="grey", cex=.5)
##D   title("A radial basis function")
##D # compare to the tensor product basis type
##D   LKinfo2<- LKrigSetup(cbind( c(-1,1), c(-1,1)), NC=6,
##D                                  nlevel=1, a.wght=4.5,alpha=1, NC.buffer=0,
##D                                  BasisType="Tensor" )
##D   PHI2<- LKrig.basis( xg,LKinfo2)
##D   image.plot(as.surface(xg, PHI2[,9]))
##D   points(  make.surface.grid( LKrigLatticeCenters(LKinfo, 1)), col="grey", cex=.5)
##D   title("Tensor product basis function")
##D   
##D   image.plot(as.surface(xg, PHI[,9] - PHI2[,9]))
##D   points(  make.surface.grid( LKrigLatticeCenters(LKinfo, 1)), col="grey", cex=.5)
##D   title(" Radial - Tensor for 9th basis function")                       
##D set.panel()
## End(Not run)
#
# example of basis function indexing
#
## Not run: 
##D # generating a basis on the domain [-1,1]X[-1,1] with 3 levels
##D # note that there are no buffering grid points.
##D   set.panel(3,2)
##D   LKinfo<-LKrigSetup(cbind( c(-1,1), c(-1,1)), NC=6,
##D                     a.wght=5, alpha=c(1,.5,.25), nlevel=3,
##D                     NC.buffer=0)
##D # evaluate the basis functions on a grid to look at them
##D   xtemp<- seq(-1,1,,40)
##D   xg<- make.surface.grid( list(x=xtemp, y= xtemp) )
##D   PHI<- LKrig.basis( xg,LKinfo)
##D # coerce to dense matrix format to make plotting easier.
##D   PHI<- spam2full(PHI)
##D # first tenth, and last basis function in each resolution level
##D # basis functions centers are added
##D  set.panel(3,3)
##D     for(  j in 1:3){
##D       id1<- LKinfo$latticeInfo$offset[j]+ 1
##D       id2<-  LKinfo$latticeInfo$offset[j]+ 10
##D       idlast<- LKinfo$latticeInfo$offset[j] +
##D                   LKinfo$latticeInfo$mx[j,1]*LKinfo$latticeInfo$mx[j,2]
##D    
##D       centers<-  make.surface.grid(LKrigLatticeCenters(LKinfo, j) )
##D       image.plot( as.surface(xg, PHI[,id1]))
##D       points( centers, cex=.2, col="grey")
##D       image.plot(as.surface(xg, PHI[,id2]))
##D       points( centers, cex=.2, col="grey")
##D       image.plot( as.surface(xg, PHI[,idlast]))
##D       points( centers, cex=.2, col="grey")
##D }
##D   set.panel()
## End(Not run)
## Not run: 
##D # examining the stationarity of covariance model
##D   temp.fun<- 
##D      function( NC.buffer=0, NC=4,  a.wght=4.01){
##D         LKinfo<- LKrigSetup(cbind( c(-1,1), c(-1,1)),nlevel=1, alpha=1,
##D                                  a.wght=a.wght, NC=NC,   
##D                                  NC.buffer=NC.buffer,
##D                                   choleskyMemory=list(nnzR=2e6))
##D         cov1y<- cov1x<- cov0x<- cov0y<-  matrix( NA, nrow=200, ncol=20)
##D         cov1dx<- cov1dy<- cov0dx<- cov0dy<- matrix( NA, nrow=200, ncol=20)
##D         cgrid<- seq( 0,1,,20)
##D         for( k in 1:20){
##D             hold<- LKrig.cov.plot( LKinfo,
##D                             center=rbind( c(cgrid[k], cgrid[k])), NP=200)
##D             cov1x[,k] <- hold$cov[,1]
##D             cov1y[,k] <- hold$cov[,2]
##D             cov1dx[,k] <- hold$d[,1]
##D             cov1dy[,k] <- hold$d[,2]
##D             hold<- LKrig.cov.plot( LKinfo,
##D                              center=rbind( c(cgrid[k],0) ), NP=200)
##D             cov0x[,k] <- hold$cov[,1]
##D             cov0y[,k] <- hold$cov[,2]
##D             cov0dx[,k] <- hold$d[,1]
##D             cov0dy[,k] <- hold$d[,2]
##D                 }
##D          matplot( cov1dx, cov1x, type="l", col= rainbow(20),
##D                          xlab="", ylab="correlation")
##D          mtext( side=1, line=-1, text="diagonal X")
##D          title( paste(  " buffer=",NC.buffer), cex=.5)
##D          matplot( cov1dy, cov1y, type="l", col= rainbow(20),
##D                         xlab="", ylab="")
##D          mtext( side=1, line=-1, text="diagonal Y")
##D          matplot(cov0dx, cov0x, type="l", col= rainbow(20),
##D                         xlab="",       ylab="")
##D          mtext( side=1, line=-1, text="middle X")
##D          matplot( cov0dy, cov0y, type="l", col= rainbow(20),
##D                          xlab="",   ylab="")
##D          mtext( side=1, line=-1, text="middle Y")
##D          title( paste( NC, a.wght), cex=.5)
##D }
##D 
##D 
##D  set.panel(3,4)
##D par(mar=c(3,4,1,0), oma=c(1,1,1,1))
##D temp.fun(  NC.buffer=5, NC=4, a.wght=4.05)
##D temp.fun(  NC.buffer=5, NC=16, a.wght=4.05)
##D temp.fun(  NC.buffer=5, NC=64, a.wght=4.05)
##D 
##D set.panel(4,4)
##D par(mar=c(3,4,1,0), oma=c(1,1,1,1))
##D temp.fun( NC.buffer=0, NC=8)
##D temp.fun( NC.buffer=2, NC=8)
##D temp.fun( NC.buffer=4, NC=8)
##D # this next one takes a while
##D temp.fun( NC.buffer=8,  NC=8)
##D # stationary == curves should all line up!
##D 
## End(Not run)




