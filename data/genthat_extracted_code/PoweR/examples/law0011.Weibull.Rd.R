library(PoweR)


### Name: law0011.Weibull
### Title: The Weibull Distribution
### Aliases: law0011.Weibull law0011
### Keywords: law, Weibull

### ** Examples
res <- gensample(11,10000,law.pars=c(8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



