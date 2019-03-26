library(qmap)


### Name: startberngamma
### Title: Rough parameter estimate for the Bernoulli-Gamma distribution
### Aliases: startberngamma

### ** Examples

gg <- rberngamma(n=300, prob=0.2, scale=1, shape=1)
startberngamma(gg)
mledist(gg,"berngamma",startberngamma(gg))



