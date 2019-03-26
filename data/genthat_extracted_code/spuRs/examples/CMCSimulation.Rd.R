library(spuRs)


### Name: CMCSimulation
### Title: A function to simulate a continuous time Markov chain.
### Aliases: CMCSimulation
### Keywords: Markov chain simulation

### ** Examples

Q <- matrix(c(-24,24,0, 2,-14,12, 0,4,-4), 
            nrow = 3, ncol = 3, byrow = TRUE)
CMCSimulation(Q,0,1)



