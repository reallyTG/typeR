library(PoweR)


### Name: law0024.GeneralizedError
### Title: The Generalized Error Distribution
### Aliases: law0024.GeneralizedError law0024
### Keywords: law, Generalized Error

### ** Examples
res <- gensample(24,10000,law.pars=c(8,6,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



