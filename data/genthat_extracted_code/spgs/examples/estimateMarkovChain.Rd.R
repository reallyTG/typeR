library(spgs)


### Name: estimateMarkovChain
### Title: Fit a first-Order Markov Chain to a Sequence of Finite Symbols
### Aliases: estimateMarkovChain
### Keywords: models

### ** Examples

#Obtain a random 3 x 3 stochastic matrix with rows and columns labelled "A", "B", "C"
mat <- rstochmat(3, labels=c("A", "B", "C"))
mat

#Simulate a Markov chain of length 500 using mat as the transition matrix
seq <- simulateMarkovChain(500, mat)

#Estimate mat and the stationary distribution for the Markov chain which generated seq
estimateMarkovChain(seq)



