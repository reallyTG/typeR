library(glrt)


### Name: gLRT4
### Title: Conduct a generalized logrank test for interval-censored data
### Aliases: gLRT4

### ** Examples

data(cmv)
cmvBlood = cmv[,c(2,3,6)]
cmvUrine = cmv[, 4:6]
gLRT4(cmvBlood)
gLRT4(cmvUrine, rho=1, gamma=1)



