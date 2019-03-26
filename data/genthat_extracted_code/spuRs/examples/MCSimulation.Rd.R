library(spuRs)


### Name: MCSimulation
### Title: A function to simulate a discrete time Markov chain.
### Aliases: MCSimulation
### Keywords: Markov chain simulation

### ** Examples

P <- matrix(c(0.5,0.5,0,0,0.7,0.1,0.2,0,0,0.1,0.1,0.8,0,0,0.7,0.3),
            nrow = 4, ncol = 4, byrow = TRUE)
MCSimulation(P, 0, 250)



