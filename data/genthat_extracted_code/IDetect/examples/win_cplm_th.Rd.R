library(IDetect)


### Name: win_cplm_th
### Title: A windows-based approach for multiple change-point detection in
###   a continuous, piecewise-linear signal via thresholding
### Aliases: win_cplm_th

### ** Examples

single.cpt <- c(seq(0, 999, 1), seq(998.5, 499, -0.5))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single.th <- win_cplm_th(single.cpt.noise)

three.cpt <- c(seq(0, 3999, 1), seq(3998.5, 1999, -0.5), seq(2001,9999,2), seq(9998,5999,-1))
three.cpt.noise <- three.cpt + rnorm(16000)
cpt.three.th <- win_cplm_th(three.cpt.noise)



