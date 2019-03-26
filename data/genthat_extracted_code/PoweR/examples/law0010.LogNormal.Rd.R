library(PoweR)


### Name: law0010.LogNormal
### Title: The Log Normal Distribution
### Aliases: law0010.LogNormal law0010
### Keywords: law, Log Normal

### ** Examples
res <- gensample(10,10000,law.pars=c(8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



