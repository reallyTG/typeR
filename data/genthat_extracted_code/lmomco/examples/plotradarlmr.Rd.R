library(lmomco)


### Name: plotradarlmr
### Title: Plot L-moment Radar Plot (Chart) Graphic
### Aliases: plotradarlmr
### Keywords: L-moment radar plot Graphics

### ** Examples

## Not run: 
##D plotradarlmr(NULL, minrat=-0.6, maxrat=0.6, tag="2 GEVs") # create the plot base
##D gev  <- vec2par(c(1230,123,-.24), type="gev") # set first parent distribution
##D poly <- list(col=NA, border=rgb(0,0,1,.1))    # set up polygon handling (blue)
##D for(i in 1:100) { # perform 100 simulations of the GEV with a sample of size 36
##D    plotradarlmr(lmoms(rlmomco(36,gev), nmom=6), plot=FALSE,
##D                 poly.control=poly, minrat=-0.6, maxrat=0.6)
##D }
##D poly <- list(col=NA, border=4, lwd=3) # set up parent polygon
##D plotradarlmr(theoLmoms(gev, nmom=6), plot=FALSE,
##D              poly.control=poly, minrat=-0.6, maxrat=0.6) # draw the parent
##D  gev <- vec2par(c(450,1323,.5), type="gev") # set second parent distribution
##D poly <- list(col=NA, border=rgb(0,1,0,.1))  # set up polygon handling (green)
##D for(i in 1:100) { # perform 100 simulations of the GEV with a sample of size 36
##D    plotradarlmr(lmoms(rlmomco(36,gev), nmom=6), plot=FALSE,
##D                 poly.control=poly, minrat=-0.6, maxrat=0.6) # draw the parent
##D }
##D poly <- list(col=NA, border=3, lwd=3) # set up parent polygon
##D plotradarlmr(theoLmoms(gev, nmom=6), plot=FALSE,
##D              poly.control=poly, minrat=-0.6, maxrat=0.6)
##D poly <- list(col=NA, border=6, lty=1, lwd=2) # make the zeros purple to standout.
##D plotradarlmr(NULL, make.zero.axis=TRUE, plot=FALSE,
##D              poly.control=poly, minrat=-0.6, maxrat=0.6)
## End(Not run)



