library(soundgen)


### Name: getIntegerRandomWalk
### Title: Discrete random walk
### Aliases: getIntegerRandomWalk

### ** Examples

rw = getRandomWalk(len = 100, rw_range = 100, rw_smoothing = .2)
r = getIntegerRandomWalk(rw, nonlinBalance = 75,
                         minLength = 10, plot = TRUE)
r = getIntegerRandomWalk(rw, nonlinBalance = 15,
                         q1 = 30, q2 = 70,
                         minLength = 10, plot = TRUE)



