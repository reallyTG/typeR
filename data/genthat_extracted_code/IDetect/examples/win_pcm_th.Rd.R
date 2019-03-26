library(IDetect)


### Name: win_pcm_th
### Title: A windows-based approach for multiple change-point detection in
###   the mean via thresholding
### Aliases: win_pcm_th

### ** Examples

single.cpt <- c(rep(4,1000),rep(0,1000))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single.th <- win_pcm_th(single.cpt.noise)

three.cpt <- c(rep(4,4000),rep(0,4000),rep(-4,4000),rep(1,4000))
three.cpt.noise <- three.cpt + rnorm(16000)
cpt.three.th <- win_pcm_th(three.cpt.noise)



