library(simstudy)


### Name: negbinomGetSizeProb
### Title: Convert negative binomial mean and dispersion parameters to size
###   and prob parameters
### Aliases: negbinomGetSizeProb

### ** Examples

set.seed(12345)
mean = 5; dispersion = 0.5
sp <- negbinomGetSizeProb(mean, dispersion)
c(sp$size, sp$prob)
vec <- rnbinom(1000, size = sp$size, prob = sp$prob)
(estMoments <- c(mean(vec), var(vec)))
(theoryMoments <- c(mean, mean + mean^2*dispersion))
(theoryMoments <- c(sp$size*(1-sp$prob)/sp$prob, sp$size*(1-sp$prob)/sp$prob^2))



