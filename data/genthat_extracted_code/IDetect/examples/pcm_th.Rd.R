library(IDetect)


### Name: pcm_th
### Title: Multiple change-point detection in the mean via thresholding
### Aliases: pcm_th

### ** Examples

single.cpt <- c(rep(4,1000),rep(0,1000))
single.cpt.noise <- single.cpt + rnorm(2000)
cpt.single.th <- pcm_th(single.cpt.noise)

three.cpt <- c(rep(4,500),rep(0,500),rep(-4,500),rep(1,500))
three.cpt.noise <- three.cpt + rnorm(2000)
cpt.three.th <- pcm_th(three.cpt.noise)

multi.cpt <- rep(c(rep(0,50),rep(3,50)),20)
multi.cpt.noise <- multi.cpt + rnorm(2000)
cpt.multi.th <- pcm_th(multi.cpt.noise)



