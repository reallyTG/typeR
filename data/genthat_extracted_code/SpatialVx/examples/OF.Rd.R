library(SpatialVx)


### Name: OF
### Title: Optical Flow Verification
### Aliases: OF OF.default OF.SpatialVx plot.OF print.OF hist.OF summary.OF
### Keywords: math regression

### ** Examples


## Not run: 
##D data(hump)
##D initial <- hump$initial
##D final <- hump$final
##D look <- OF(final, xhat=initial, W=9, verbose=TRUE)
##D plot(look) # Compare with Fig. 1 in Marzban and Sandgathe (2010).
##D par(mfrow=c(1,1))
##D hist(look) # 2-d histogram.
##D plot(look, full=TRUE) # More plots.
##D summary(look)
##D 
##D # Another way to skin the cat.
##D hold <- make.SpatialVx( final, initial, field.type = "Bi-variate Gaussian",
##D     obs.name = "final", model.name = "initial" )
##D 
##D look2 <- OF(hold, W=9, verbose=TRUE)
##D plot(look2)
##D par(mfrow=c(1,1))
##D hist(look2)
##D plot(look2, full=TRUE)
##D summary(look2)
## End(Not run)



