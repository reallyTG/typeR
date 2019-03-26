library(sppmix)


### Name: mc_gof
### Title: Monte Carlo goodness of fit test
### Aliases: mc_gof

### ** Examples

## No test: 
# Create the intensity surface
intsurf1 <- normmix(ps = c(.3, .7), mus = list(c(0.2, 0.2), c(.8, .8)), sigmas =
 list(.01*diag(2), .01*diag(2)), lambda = 100, win = spatstat::square(1))
# Generate a point pattern
pp1 <- rsppmix(intsurf1)
# Assess goodness-of-fit. Since this is the right model, we should get gof. Make
# sure L is large for more accurate results
mc_gof(pp1, intsurf1, 0.05)
# Create another intensity surface
intsurf2 <- normmix(ps = c(.5, .5), mus = list(c(0.2, 0.8), c(.8, .2)), sigmas =
 list(.01*diag(2), .01*diag(2)), lambda = 100, win = spatstat::square(1))
# Assess goodness-of-fit against this Poisson. Since this is the wrong model,
# we should NOT get gof
mc_gof(pp1, intsurf2, 0.05)
## End(No test)




