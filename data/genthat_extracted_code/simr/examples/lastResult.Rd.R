library(simr)


### Name: lastResult
### Title: Recover an unsaved simulation
### Aliases: lastResult

### ** Examples

fm1 <- lmer(y ~ x + (1|g), data=simdata)
powerSim(fm1, nsim=10)
ps1 <- lastResult()




