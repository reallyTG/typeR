library(PottsUtils)


### Name: SW
### Title: Generate Random Samples from a Compound Potts Model by the
###   Swendsen-Wang Algorithm
### Aliases: SW
### Keywords: distribution

### ** Examples

  #Example 1: Generate 100 samples from a Potts model with the
  #           neighborhood structure corresponding to a
  #           second-order Markov random field defined on a 
  #           3*3 2D graph. The number of colors is 2.
  #           beta=0.1. All weights are equal to 1.
 
  edges <- getEdges(mask=matrix(1, 2, 2), neiStruc=rep(2,4))
  set.seed(100)
  SW(n=500, nvertex=4, ncolor=2, edges, beta=0.8)



