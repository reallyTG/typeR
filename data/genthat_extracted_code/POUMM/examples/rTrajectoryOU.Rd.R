library(POUMM)


### Name: rTrajectoryOU
### Title: Generation of a random trajectory of an OU process starting from
###   a given initial state
### Aliases: rTrajectoryOU

### ** Examples

z0 <- 0
nSteps <- 100
t <- 0.01
trajectory <- rTrajectoryOU(z0, t, 2, 2, 1, steps = nSteps)
plot(trajectory, type = 'l')




