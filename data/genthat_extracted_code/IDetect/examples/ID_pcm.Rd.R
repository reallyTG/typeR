library(IDetect)


### Name: ID_pcm
### Title: Multiple change-point detection in the mean of a vector using
###   the Isolate-Detect methodology
### Aliases: ID_pcm

### ** Examples

single.cpt <- c(rep(4,1000),rep(0,1000))
single.cpt.noise <- single.cpt + rnorm(2000)
cpts_detect <- ID_pcm(single.cpt.noise)

three.cpt <- c(rep(4,500),rep(0,500),rep(-4,500),rep(1,500))
three.cpt.noise <- three.cpt + rnorm(2000)
cpts_detect_three <- ID_pcm(three.cpt.noise)

multi.cpt <- rep(c(rep(0,50),rep(3,50)),20)
multi.cpt.noise <- multi.cpt + rnorm(2000)
cpts_detect_multi <- ID_pcm(multi.cpt.noise)



