library(MBESS)


### Name: ss.aipe.src
### Title: sample size necessary for the accuracy in parameter estimation
###   approach for a standardized regression coefficient of interest
### Aliases: ss.aipe.src
### Keywords: design

### ** Examples

# Exchangable correlation structure
# Rho.YX <- c(.3, .3, .3, .3, .3)
# RHO.XX <- rbind(c(1, .5, .5, .5, .5), c(.5, 1, .5, .5, .5), c(.5, .5, 1, .5, .5),
# c(.5, .5, .5, 1, .5), c(.5, .5, .5, .5, 1))

# ss.aipe.src(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
# Rho.YX=Rho.YX, which.predictor=1, conf.level=1-.05)

# ss.aipe.src(width=.1, which.width="Full", sigma.Y=1, sigma.X=1, RHO.XX=RHO.XX,
# Rho.YX=Rho.YX, which.predictor=1, conf.level=1-.05, degree.of.certainty=.85)



