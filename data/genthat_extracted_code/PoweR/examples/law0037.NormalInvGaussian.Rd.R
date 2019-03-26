library(PoweR)


### Name: law0037.NormalInvGaussian
### Title: The Normal-inverse Gaussian Distribution
### Aliases: law0037.NormalInvGaussian law0037
### Keywords: law, Normal-inverse Gaussian

### ** Examples
res <- gensample(37,10000,law.pars=c(3,2,1,0.5))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



