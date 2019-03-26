library(PoweR)


### Name: law0021.SkewNormal
### Title: The Skew Normal Distribution
### Aliases: law0021.SkewNormal law0021
### Keywords: law, Normal, Skew Normal

### ** Examples
res <- gensample(21,10000,law.pars=c(8,6,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



