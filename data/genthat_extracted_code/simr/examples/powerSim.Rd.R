library(simr)


### Name: powerSim
### Title: Estimate power by simulation.
### Aliases: powerSim

### ** Examples

fm1 <- lmer(y ~ x + (1|g), data=simdata)
powerSim(fm1, nsim=10)




