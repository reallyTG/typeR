library(SpatialVx)


### Name: fss2dfun
### Title: Various Verification Statistics on Possibly
###   Neighborhood-Smoothed Fields.
### Aliases: fss2dfun fuzzyjoint2dfun MinCvg2dfun multicon2dfun
###   pragmatic2dfun upscale2dfun
### Keywords: math

### ** Examples

x <- y <- matrix( 0, 100, 100)
x[ sample(1:100, 10), sample(1:100, 10)] <- 1
y[ sample(1:100, 20), sample(1:100, 20)] <- 1
Px <- kernel2dsmooth( x, kernel.type="boxcar", n=9, xdim=c(100, 100))
Py <- kernel2dsmooth( y, kernel.type="boxcar", n=9, xdim=c(100, 100))
par( mfrow=c(2,2))
image( x, col=c("grey", "darkblue"), main="Simulated Observed Events")
image( y, col=c("grey", "darkblue"), main="Simulated Forecast Events")
image( Px, col=c("grey", tim.colors(256)), main="Forecast Event Frequencies (9 nearest neighbors)")
image( Py, col=c("grey", tim.colors(256)), main="Smoothed Observed Events (9 nearest neighbors)")
fss2dfun( Py, Px)

## Not run: 
##D data( "pert004" )
##D data( "pert000" )
##D 
##D fbin <- obin <- matrix(0, 601, 501)
##D 
##D fbin[ pert004 >= 12] <- 1
##D obin[ pert000 >= 12] <- 1
##D 
##D Pf <- kernel2dsmooth( fbin, kernel.type="boxcar", n=33, xdim=c(601, 501))
##D Po <- kernel2dsmooth( obin, kernel.type="boxcar", n=33, xdim=c(601, 501))
##D 
##D fss2dfun(Pf, Po)
##D 
##D fuzzyjoint2dfun(Pf, Po)
##D 
##D Pe <- 1/(33^2) # At least one event in the neighborhood.
##D 
##D MinCvg2dfun(Pf >= Pe, Po >= Pe)
##D 
##D multicon2dfun(Pf >= Pe, obin)
##D 
##D pragmatic2dfun(Pf, obin, mIx=mean( obin, na.rm=TRUE))
##D 
##D Sf <- kernel2dsmooth( pert004, kernel.type="boxcar", n=33, xdim=c(601, 501))
##D So <- kernel2dsmooth( pert000, kernel.type="boxcar", n=33, xdim=c(601, 501))
##D 
##D upscale2dfun( Sf, So, threshold=12)
## End(Not run)



