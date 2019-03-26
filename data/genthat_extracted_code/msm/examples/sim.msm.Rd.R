library(msm)


### Name: sim.msm
### Title: Simulate one individual trajectory from a continuous-time Markov
###   model
### Aliases: sim.msm
### Keywords: datagen

### ** Examples


qmatrix <- rbind(
                 c(-0.2,   0.1,  0.1 ),
                 c(0.5,   -0.6,  0.1 ),
                 c(0,  0,  0)
                 )
sim.msm(qmatrix, 30)



