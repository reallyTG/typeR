library(POT)


### Name: fitmcgpd
### Title: Fitting Markov Chain Models to Peaks Over a Threshold
### Aliases: fitmcgpd
### Keywords: models

### ** Examples

mc <- simmc(1000, alpha = 0.25)
mc <- qgpd(mc, 0, 1, 0.25)
##A first application when marginal parameter are estimated
fitmcgpd(mc, 0)
##Another one where marginal parameters are fixed
mle <- fitgpd(mc, 0)
fitmcgpd(mc, 0, scale = mle$param["scale"], shape = mle$param["shape"])



