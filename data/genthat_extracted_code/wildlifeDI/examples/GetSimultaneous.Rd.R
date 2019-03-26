library(wildlifeDI)


### Name: GetSimultaneous
### Title: Identify simultaneous fixes between trajectories
### Aliases: GetSimultaneous
### Keywords: processing

### ** Examples

data(deer)
deer37 <- deer[1]
deer38 <- deer[2]
#tc = 7.5 minutes
trajs <- GetSimultaneous(deer37, deer38, tc = 7.5*60)
deer37 <- trajs[1]
deer38 <- trajs[2]



