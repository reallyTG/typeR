library(PoweR)


### Name: law0006.Beta
### Title: The Beta Distribution
### Aliases: law0006.Beta law0006
### Keywords: law, Beta

### ** Examples
res <- gensample(6,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



