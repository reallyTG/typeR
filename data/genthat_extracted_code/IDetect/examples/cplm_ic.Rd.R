library(IDetect)


### Name: cplm_ic
### Title: Multiple change-point detection in a continuous piecewise-linear
###   signal via minimising an information criterion
### Aliases: cplm_ic

### ** Examples

single.cpt <- c(seq(0, 999, 1), seq(998.5, 499, -0.5))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single.ic <- cplm_ic(single.cpt.noise)

three.cpt <- c(seq(0, 499, 1), seq(498.5, 249, -0.5), seq(250,1249,2), seq(1248,749,-1))
three.cpt.noise <- three.cpt + rnorm(2000)
cpt.three.ic <- cplm_ic(three.cpt.noise)



