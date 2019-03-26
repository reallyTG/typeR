library(spuRs)


### Name: MCEstimation
### Title: A function to estimate the transition matrix for a discrete time
###   Markov chain.
### Aliases: MCEstimation
### Keywords: Markov chain estimation

### ** Examples

P <- matrix(c(0.5,0.5,0,0,0.7,0.1,0.2,0,0,0.1,0.1,0.8,0,0,0.7,0.3),
            nrow = 4, ncol = 4, byrow = TRUE)
statehist<-MCSimulation(P, 0, 3000)
MCEstimation(statehist, 3)



