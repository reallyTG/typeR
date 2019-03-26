library(PoweR)


### Name: law0001.Laplace
### Title: The Laplace Distribution
### Aliases: law0001.Laplace law0001
### Keywords: law, Laplace

### ** Examples
res <- gensample(1,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



