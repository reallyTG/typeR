library(PoweR)


### Name: law0003.Cauchy
### Title: The Cauchy Distribution
### Aliases: law0003.Cauchy law0003
### Keywords: law, Cauchy

### ** Examples
res <- gensample(3,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



