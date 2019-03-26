library(PoweR)


### Name: law0002.Normal
### Title: The Normal Distribution
### Aliases: law0002.Normal law0002
### Keywords: law, Normal, Gaussian

### ** Examples
res <- gensample(2,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



