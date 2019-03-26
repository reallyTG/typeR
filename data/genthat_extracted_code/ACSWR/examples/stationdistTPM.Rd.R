library(ACSWR)


### Name: stationdistTPM
### Title: A function which will return the stationary distribution of an
###   ergodic Markov chain
### Aliases: stationdistTPM
### Keywords: stationary distribution Ergodic Markov chain

### ** Examples

P <- matrix(nrow=3,ncol=3) # An example
P[1,] <- c(1/3,1/3,1/3)
P[2,] <- c(1/4,1/2,1/4)
P[3,] <- c(1/6,1/3,1/2)
stationdistTPM(P)



