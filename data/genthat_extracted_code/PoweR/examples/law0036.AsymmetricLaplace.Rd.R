library(PoweR)


### Name: law0036.AsymmetricLaplace
### Title: The Asymmetric Laplace Distribution
### Aliases: law0036.AsymmetricLaplace law0036
### Keywords: law, Asymmetric Laplace

### ** Examples
res <- gensample(36,10000,law.pars=c(9,2,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



