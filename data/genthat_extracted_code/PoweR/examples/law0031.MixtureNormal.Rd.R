library(PoweR)


### Name: law0031.MixtureNormal
### Title: The Mixture Normal Distribution
### Aliases: law0031.MixtureNormal law0031
### Keywords: law, Normal, Mixture Normal

### ** Examples
res <- gensample(31,10000,law.pars=c(0.9,8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



