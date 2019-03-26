library(PoweR)


### Name: law0039.modifiedAsymmetricPowerDistribution
### Title: The modified Asymmetric Power Distribution
### Aliases: law0039.modifiedAsymmetricPowerDistribution law0039
### Keywords: law, modified Asymmetric Power Distribution

### ** Examples

res <- gensample(39, 10000, law.pars = c(3, 2, 0.5, 1))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



