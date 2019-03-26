library(PottsUtils)


### Name: BlocksGibbs
### Title: Generate Random Samples from a Potts Model Using the
###   Checkerboard Idea
### Aliases: BlocksGibbs
### Keywords: distribution

### ** Examples

  #Example 1: Generate 100 samples from a repulsion Potts model with the
  #           neighborhood structure corresponding to a first-order
  #           Markov random field defined on a 3*3 2D graph.
  #           The number of colors is 3 and beta=0.1,a_1=2,a_2=1,a_3=0.
  #           All weights are equal to 1.
 
  neighbors <- getNeighbors(mask=matrix(1, 3, 3), neiStruc=c(2,2,0,0))
  blocks <- getBlocks(mask=matrix(1, 3, 3), nblock=2)
  spatialMat <- matrix(c(2,1,0, 1,2,1,0,1,2), ncol=3)
  BlocksGibbs(n=100, nvertex=9, ncolor=3, neighbors=neighbors, blocks=blocks,
              spatialMat=spatialMat, beta=0.1)



