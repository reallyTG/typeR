library(PoweR)


### Name: law0007.Uniform
### Title: The Uniform Distribution
### Aliases: law0007.Uniform law0007
### Keywords: law, Uniform

### ** Examples
res <- gensample(7,10000,law.pars=c(2,9))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



