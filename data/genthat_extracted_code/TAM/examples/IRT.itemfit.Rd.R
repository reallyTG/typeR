library(TAM)


### Name: IRT.itemfit.tam
### Title: RMSD Item Fit Statistics for 'TAM' Objects
### Aliases: IRT.itemfit.tam.mml IRT.itemfit.tam.mml.2pl
###   IRT.itemfit.tam.mml.mfr IRT.itemfit.tam.mml.3pl
### Keywords: Thurstonian thresholds

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: RMSD item fit statistic data.read
##D #############################################################################
##D 
##D library(sirt)
##D data(data.read,package="sirt")
##D dat <- data.read
##D 
##D #*** fit 1PL model
##D mod1 <- TAM::tam.mml( dat )
##D summary(mod1)
##D 
##D #*** fit 2PL model
##D mod2 <- TAM::tam.mml.2pl( dat )
##D summary(mod2)
##D 
##D #*** assess RMSEA item fit
##D fmod1 <- IRT.itemfit(mod1)
##D fmod2 <- IRT.itemfit(mod2)
##D # summary of fit statistics
##D summary( fmod1 )
##D summary( fmod2 )
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulated 2PL data and fit of 1PL model
##D #############################################################################
##D 
##D set.seed(987)
##D N <- 1000    # 1000 persons
##D I <- 10      # 10 items
##D # define item difficulties and item slopes
##D b <- seq(-2,2,len=I)
##D a <- rep(1,I)
##D a[c(3,8)] <- c( 1.7, .4 )
##D # simulate 2PL data
##D dat <- sirt::sim.raschtype( theta=rnorm(N), b=b, fixed.a=a)
##D 
##D # fit 1PL model
##D mod <- TAM::tam.mml( dat )
##D 
##D # RMSEA item fit
##D fmod <- IRT.itemfit(mod)
##D round( fmod, 3 )
## End(Not run)



