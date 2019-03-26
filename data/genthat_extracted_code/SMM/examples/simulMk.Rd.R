library(SMM)


### Name: simulMk
### Title: Simulation of a k-th order Markov chain
### Aliases: simulMk
### Keywords: Markov models Simulation

### ** Examples


### Example 1 ###
# Second order model with state space {a,c,g,t}
E <- c("a","c","g","t")
S = length(E)
init.distribution <- c(1/6,1/6,5/12,3/12)
k<-2
p <- matrix(0.25, nrow = S^k, ncol = S)

# We simulate 3 sequences of size 1000, 10000 and 2000 respectively.
simulMk(E = E, nbSeq = 3, lengthSeq = c(1000, 10000, 2000), Ptrans = p, 
init = init.distribution, k = k)

### Example 2 ###
# first order model with state space {1,2,3}
E <- c(1,2,3)
S <- length(E)
init.distr <- rep(1/S, 3)
p <- matrix(c(0.3,0.2,0.5,0.1,0.6,0.3,0.2,0.4,0.4), nrow = 3, byrow = TRUE)

# We simulate one sequence of size 100
simulMk(E = E, nbSeq = 1, lengthSeq = 100, Ptrans = p, init = init.distr, k = 1)



