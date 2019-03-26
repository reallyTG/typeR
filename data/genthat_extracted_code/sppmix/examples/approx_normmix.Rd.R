library(sppmix)


### Name: approx_normmix
### Title: Approximate the masses of bivariate normal mixture components
### Aliases: approx_normmix

### ** Examples

## No test: 
truemix = normmix(ps = c(.3, .7), mus = list(c(0.2, 0.2),
 c(.8, .8)), sigmas =list(.01*diag(2),.01*diag(2)))
approx_normmix(truemix,xlim= c(-2, 2), ylim = c(-2, 2))
## End(No test)




