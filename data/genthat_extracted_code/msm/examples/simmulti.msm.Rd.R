library(msm)


### Name: simmulti.msm
### Title: Simulate multiple trajectories from a multi-state Markov model
###   with arbitrary observation times
### Aliases: simmulti.msm
### Keywords: datagen

### ** Examples

### Simulate 100 individuals with common observation times
sim.df <- data.frame(subject = rep(1:100, rep(13,100)), time = rep(seq(0, 24, 2), 100))
qmatrix <- rbind(c(-0.11,   0.1,  0.01 ),
                 c(0.05,   -0.15,  0.1 ),
                 c(0.02,   0.07, -0.09))
simmulti.msm(sim.df, qmatrix)



