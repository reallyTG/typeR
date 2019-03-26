library(MBESS)


### Name: ss.aipe.rc
### Title: Sample size necessary for the accuracy in parameter estimation
###   approach for an unstandardized regression coefficient of interest
### Aliases: ss.aipe.rc
### Keywords: design

### ** Examples

## Not run: 
##D # Exchangable correlation structure
##D # Rho.YX <- c(.3, .3, .3, .3, .3)
##D # RHO.XX <- rbind(c(1, .5, .5, .5, .5), c(.5, 1, .5, .5, .5), c(.5, .5, 1, .5, .5),
##D # c(.5, .5, .5, 1, .5), c(.5, .5, .5, .5, 1))
##D 
##D # ss.aipe.rc(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
##D # Rho.YX=Rho.YX, which.predictor=1, conf.level=1-.05)
##D 
##D # ss.aipe.rc(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
##D # Rho.YX=Rho.YX, which.predictor=1,  conf.level=1-.05, degree.of.certainty=.85)
## End(Not run)



