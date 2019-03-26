library(PottsUtils)


### Name: Wolff
### Title: Generate Random Samples from a Compound Potts Model by the Wolff
###   Algorithm
### Aliases: Wolff
### Keywords: distribution

### ** Examples

  #Example 1: Generate 100 samples from a Potts model with the
  #           neighborhood structure corresponding to a
  #           second-order Markov random field defined on a 
  #           3*3 2D graph. The number of colors is 2.
  #           beta=0.7. All weights are equal to 1.

  neighbors <- getNeighbors(mask=matrix(1, 3, 3), neiStruc=rep(2,4))
  Wolff(n=100, nvertex=9, ncolor=2, neighbors, beta=0.7)



