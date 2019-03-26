library(qmap)


### Name: startbernweibull
### Title: Rough parameter estimate for the Bernoulli-Weibull distribution
### Aliases: startbernweibull

### ** Examples

gg <- rbernweibull(n=300, prob=0.2, scale=1, shape=1)
startbernweibull(gg)
mledist(gg,"bernweibull",startbernweibull(gg))



