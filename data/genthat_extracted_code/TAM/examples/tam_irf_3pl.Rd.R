library(TAM)


### Name: tam_irf_3pl
### Title: Item Response Function for the 3PL Model
### Aliases: tam_irf_3pl

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: 2PL example
##D #############################################################################
##D 
##D library(sirt)
##D data(data.read, package="sirt")
##D dat <- data.read
##D 
##D #* estimate 2PL model
##D mod <- TAM::tam.mml.2pl( resp=dat )
##D #* define theta vector
##D theta <- seq(-3,3, len=41)
##D #* compute item response probabilities
##D probs <- TAM::tam_irf_3pl( theta=theta, AXsi=mod$AXsi, B=mod$B )
##D str(probs)
## End(Not run)



