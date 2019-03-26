library(IDetect)


### Name: pcm_ic
### Title: Multiple change-point detection in the mean via minimising an
###   information criterion
### Aliases: pcm_ic

### ** Examples

single.cpt <- c(rep(4,1000),rep(0,1000))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single.ic <- pcm_ic(single.cpt.noise)

three.cpt <- c(rep(4,500),rep(0,500),rep(-4,500),rep(1,500))
three.cpt.noise <- three.cpt + rnorm(2000)
cpt.three.ic <- pcm_ic(three.cpt.noise)



