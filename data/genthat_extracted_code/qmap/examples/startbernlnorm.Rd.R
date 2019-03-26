library(qmap)


### Name: startbernlnorm
### Title: Rough parameter estimate for the Bernoulli-Log-Normal
###   distribution
### Aliases: startbernlnorm

### ** Examples

gg <- rbernlnorm(n=300, prob=0.2, meanlog=1, sdlog=1)
startbernlnorm(gg)
mledist(gg,"bernlnorm",startbernlnorm(gg))



