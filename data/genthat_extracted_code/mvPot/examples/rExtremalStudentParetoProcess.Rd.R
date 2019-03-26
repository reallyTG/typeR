library(mvPot)


### Name: rExtremalStudentParetoProcess
### Title: Simulation of extremal Student generalized Pareto vectors
### Aliases: rExtremalStudentParetoProcess

### ** Examples

loc <- expand.grid(1:4, 1:4)
Sigma <- exp(-as.matrix(dist(loc))^1.5)
rExtremalStudentParetoProcess(1000, Sigma, nu = 2)



