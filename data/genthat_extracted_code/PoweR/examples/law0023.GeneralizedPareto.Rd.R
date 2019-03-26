library(PoweR)


### Name: law0023.GeneralizedPareto
### Title: The Generalized Pareto Distribution
### Aliases: law0023.GeneralizedPareto law0023
### Keywords: law, Generalized Pareto

### ** Examples
res <- gensample(23,10000,law.pars=c(8,6,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



