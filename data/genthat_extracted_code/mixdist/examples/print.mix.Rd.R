library(mixdist)


### Name: print.mix
### Title: Print Mix Object
### Aliases: print.mix
### Keywords: print

### ** Examples

data(pike65)
data(pikepar)
fit <- mix(pike65, pikepar, "gamma", mixconstr(consigma = "CCV"), emsteps = 3)
fit
print(fit)
print.mix(fit)
print.default(fit)



