library(IDetect)


### Name: cplm_th
### Title: Multiple change-point detection in a continuous,
###   piecewise-linear signal via thresholding
### Aliases: cplm_th

### ** Examples

single.cpt <- c(seq(0, 999, 1), seq(998.5, 499, -0.5))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single.th <- cplm_th(single.cpt.noise)

three.cpt <- c(seq(0, 499, 1), seq(498.5, 249, -0.5), seq(251,1249,2), seq(1248,749,-1))
three.cpt.noise <- three.cpt + rnorm(2000)
cpt.three.th <- cplm_th(three.cpt.noise)

multi.cpt <- rep(c(seq(0,49,1), seq(48,0,-1)),20)
multi.cpt.noise <- multi.cpt + rnorm(1980)
cpt.multi.th <- cplm_th(multi.cpt.noise)



