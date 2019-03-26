library(PottsUtils)


### Name: getWeights
### Title: Get All Weights of a Graph
### Aliases: getWeights
### Keywords: spatial

### ** Examples

  #Example 1: get all weights of a 2D graph based on neighborhood structure
  #           corresponding to the first-order Markov random field.
  mask <- matrix(1 ,nrow=2, ncol=3)
  getWeights(mask, neiStruc=c(2,2,0,0))

  #Example 2: get all weights of a 2D graph based on neighborhood structure
  #           corresponding to the second-order Markov random field.
  #           Put the weights in a matrix form corresponding to
  #           neighbors of vertices.
  mask <- matrix(1 ,nrow=3, ncol=3)
  getWeights(mask, neiStruc=c(2,2,2,2), format=2)

  #Example 3: get all weights of a 3D graph based on 6 neighbors structure
  #           where the neighbors of a vertex comprise its available
  #           N,S,E,W, upper and lower adjacencies. 
  mask <- array(1, dim=rep(3,3))
  n61 <- matrix(c(2,2,0,0,
                  0,2,0,0,
                  0,0,0,0), nrow=3, byrow=TRUE)
  getWeights(mask, neiStruc=n61)
 


