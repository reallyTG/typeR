library(telefit)


### Name: maternEffectiveRange
### Title: Compute effective range for Matern correlation to drop to a
###   specified level
### Aliases: maternEffectiveRange

### ** Examples


# effective range for exponential covariance function with range = 1,
# which is theoretically known to equal -ln(.05)
maternEffectiveRange(cor = .05, range = 1, smoothness = .5)




