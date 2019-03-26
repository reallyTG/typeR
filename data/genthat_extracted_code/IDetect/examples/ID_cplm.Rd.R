library(IDetect)


### Name: ID_cplm
### Title: Multiple change-point detection for a continuous,
###   piecewise-linear signal using the Isolate-Detect methodology
### Aliases: ID_cplm

### ** Examples

single.cpt <- c(seq(0, 999, 1), seq(998.5, 499, -0.5))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single <- ID_cplm(single.cpt.noise)

three.cpt <- c(seq(0, 499, 1), seq(498.5, 249, -0.5), seq(250,1249,2), seq(1248,749,-1))
three.cpt.noise <- three.cpt + rnorm(2000)
cpt.three <- ID_cplm(three.cpt.noise)

multi.cpt <- rep(c(seq(0,49,1), seq(48,0,-1)),20)
multi.cpt.noise <- multi.cpt + rnorm(1980)
cpt.multi <- ID_cplm(multi.cpt.noise)



