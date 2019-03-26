library(IDetect)


### Name: est_signal
### Title: Estimate the signal
### Aliases: est_signal

### ** Examples

single.cpt.pcm <- c(rep(4,1000),rep(0,1000))
single.cpt.pcm.noise <- single.cpt.pcm + rnorm(2000)
cpt.single.pcm <- ID_pcm(single.cpt.pcm.noise)
fit.cpt.single.pcm <- est_signal(single.cpt.pcm.noise, cpt.single.pcm$cpt, type = "mean")

three.cpt.pcm <- c(rep(4,500),rep(0,500),rep(-4,500),rep(1,500))
three.cpt.pcm.noise <- three.cpt.pcm + rnorm(2000)
cpt.three.pcm <- ID_pcm(three.cpt.pcm.noise)
fit.cpt.three.pcm <- est_signal(three.cpt.pcm.noise, cpt.three.pcm$pcm, type = "mean")

single.cpt.plm <- c(seq(0,999,1),seq(998.5,499,-0.5))
single.cpt.plm.noise <- single.cpt.plm + rnorm(2000)
cpt.single.plm <- ID_cplm(single.cpt.plm.noise)
fit.cpt.single.plm <- est_signal(single.cpt.plm.noise, cpt.single.plm$cpt, type = "slope")



