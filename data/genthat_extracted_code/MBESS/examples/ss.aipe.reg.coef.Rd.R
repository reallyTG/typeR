library(MBESS)


### Name: ss.aipe.reg.coef
### Title: Sample size necessary for the accuracy in parameter estimation
###   approach for a regression coefficient of interest
### Aliases: ss.aipe.reg.coef
### Keywords: design

### ** Examples

## Not run: 
##D # Exchangable correlation structure
##D # Rho.YX <- c(.3, .3, .3, .3, .3)
##D # RHO.XX <- rbind(c(1, .5, .5, .5, .5), c(.5, 1, .5, .5, .5), c(.5, .5, 1, .5, .5), 
##D # c(.5, .5, .5, 1, .5), c(.5, .5, .5, .5, 1))
##D # ss.aipe.reg.coef(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
##D # Rho.YX=Rho.YX, which.predictor=1, Noncentral=FALSE, conf.level=1-.05, 
##D # degree.of.certainty=NULL, Suppress.Statement=FALSE)
##D 
##D # ss.aipe.reg.coef(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
##D # Rho.YX=Rho.YX, which.predictor=1, Noncentral=FALSE, conf.level=1-.05, 
##D # degree.of.certainty=.85, Suppress.Statement=FALSE)
##D 
##D # ss.aipe.reg.coef(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
##D # Rho.YX=Rho.YX, which.predictor=1, Noncentral=TRUE, conf.level=1-.05,
##D # degree.of.certainty=NULL, Suppress.Statement=FALSE)
##D 
##D # ss.aipe.reg.coef(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX, 
##D # Rho.YX=Rho.YX, which.predictor=1, Noncentral=TRUE, conf.level=1-.05, 
##D # degree.of.certainty=.85, Suppress.Statement=FALSE)
## End(Not run)



