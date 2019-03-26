library(sppmix)


### Name: normmix
### Title: Create a 2d mixture with normal components
### Aliases: normmix print.normmix print.intensity_surface summary.normmix
###   summary.intensity_surface

### ** Examples

## No test: 
mix1 <- normmix(ps = c(.3, .7), mus = list(c(0.2, 0.2), c(.8, .8)),
 sigmas = list(.01*diag(2), .01*diag(2)))
mix1
summary(mix1)
intsurf1 <- normmix(ps = c(.3, .7), mus = list(c(0.2, 0.2), c(.8, .8)),
 sigmas = list(.01*diag(2), .01*diag(2)), lambda = 100, win = spatstat::square(1))
intsurf1
summary(intsurf1)
## End(No test)




