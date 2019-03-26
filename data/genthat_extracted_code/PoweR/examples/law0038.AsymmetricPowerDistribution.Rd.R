library(PoweR)


### Name: law0038.AsymmetricPowerDistribution
### Title: The Asymmetric Power Distribution
### Aliases: law0038.AsymmetricPowerDistribution law0038
### Keywords: law, Asymmetric Power Distribution

### ** Examples

res <- gensample(38,10000,law.pars=c(3,2,0.5,1))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



