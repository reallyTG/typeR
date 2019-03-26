library(PoweR)


### Name: law0026.Gumbel
### Title: The Gumbel Distribution
### Aliases: law0026.Gumbel law0026
### Keywords: law, Gumbel

### ** Examples
res <- gensample(26,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



