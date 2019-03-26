library(metaLik)


### Name: simulate.metaLik
### Title: Simulate meta-analysis outcomes
### Aliases: simulate.metaLik
### Keywords: regression models

### ** Examples

data(vaccine)
m <- metaLik(y~latitude, data=vaccine, sigma2=sigma2)
sim <- simulate(m, nsim=2)
sim



