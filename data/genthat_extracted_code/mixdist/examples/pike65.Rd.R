library(mixdist)


### Name: pike65
### Title: Length-Frequency Data for Heming Lake Pike
### Aliases: pike65
### Keywords: datasets

### ** Examples

data(pike65)
data(pikepar)
plot.mixdata(pike65)
fit <- mix(pike65, pikepar, "lnorm", constr = mixconstr(consigma = "CCV"), emsteps = 3)
plot(fit)



