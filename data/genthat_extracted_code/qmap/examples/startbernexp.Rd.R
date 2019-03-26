library(qmap)


### Name: startbernexp
### Title: Rough parameter estimate for the Bernoulli-Exponential
###   distribution
### Aliases: startbernexp

### ** Examples

gg <- rbernexp(n=300, prob=0.2, rate=1)
startbernexp(gg)
mledist(gg,"bernexp",startbernexp(gg))



