library(sppmix)


### Name: demo_mix
### Title: Demo objects
### Aliases: demo_mix demo_intsurf demo_genPPP demo_truemix3
###   demo_truemix3comp demo_truesurf3 demo_intsurf3comp
### Keywords: datasets

### ** Examples

## No test: 
demo_mix <- normmix(ps = c(.3, .7), mus = list(c(0.2, 0.2), c(.8, .8)),
 sigmas = list(.01*diag(2), .01*diag(2)))
demo_intsurf <- normmix(ps = c(.3, .7), mus = list(c(0.2, 0.2),
 c(.8, .8)),sigmas = list(.01*diag(2), .01*diag(2)), lambda = 100,
 win = spatstat::square(1))
demo_genPPP<-rsppmix(demo_truesurf3, truncate=FALSE)
## End(No test)




