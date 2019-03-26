library(PoweR)


### Name: law0005.Gamma
### Title: The Gamma Distribution
### Aliases: law0005.Gamma law0005
### Keywords: law, Gamma

### ** Examples
res <- gensample(5,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



