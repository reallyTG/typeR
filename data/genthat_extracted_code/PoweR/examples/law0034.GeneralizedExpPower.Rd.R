library(PoweR)


### Name: law0034.GeneralizedExpPower
### Title: The Generalized Exponential Power Distribution
### Aliases: law0034.GeneralizedExpPower law0034
### Keywords: law, Generalized Exponential Power

### ** Examples
res <- gensample(34,10000,law.pars=c(1,8,4))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



