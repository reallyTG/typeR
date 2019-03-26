library(psd)


### Name: tapers-constraints
### Title: Taper constraint methods
### Aliases: constrain_tapers constrain_tapers.default
###   constrain_tapers.tapers minspan minspan.default minspan.tapers
###   tapers-constraints

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Taper constraint procedures
##D ##
##D 
##D data(magnet)
##D X <- magnet$clean
##D 
##D ##
##D ## spectrum
##D PSD <- psdcore(X, ntaper=10, refresh=TRUE)
##D ## optimize tapers
##D kopt <- riedsid(PSD)
##D kopt.loess  <- riedsid(PSD, c.method="loess.smooth")
##D #
##D plot(kopt, log.y=TRUE, ylim =c(.1, 3e2))
##D lines(kopt.loess)
##D 
##D ##
##D ## To compare all the methods at once:
##D demo("ctap")
##D 
## End(Not run)#REX



