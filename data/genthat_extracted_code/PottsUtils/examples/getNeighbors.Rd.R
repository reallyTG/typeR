library(PottsUtils)


### Name: getNeighbors
### Title: Get Neighbors of All Vertices of a Graph
### Aliases: getNeighbors
### Keywords: spatial

### ** Examples

  #Example 1: get all neighbors of a 1D graph.
  mask <- c(0,0,rep(1,4),0,1,1,0,0,1,1,1)
  getNeighbors(mask, neiStruc=2)

  #Example 2: get all neighbors of a 2D graph based on neighborhood structure
  #           corresponding to the second-order Markov random field.
  mask <- matrix(1, nrow=2, ncol=3)
  getNeighbors(mask, neiStruc=c(2,2,2,2))

  #Example 3: get all neighbors of a 3D graph based on 6 neighbors structure
  #           where the neighbors of a vertex comprise its available
  #           N,S,E,W, upper and lower adjacencies. To achieve it, there
  #           are several ways, including the two below.
  mask <- array(1, dim=rep(3,3))
  n61 <- matrix(c(2,2,0,0,
                  0,2,0,0,
                  0,0,0,0), nrow=3, byrow=TRUE)
  n62 <- matrix(c(2,0,0,0,
                  0,2,0,0,
                  2,0,0,0), nrow=3, byrow=TRUE)
  n1 <- getNeighbors(mask, neiStruc=n61)
  n2 <- getNeighbors(mask, neiStruc=n62)
  n1 <- apply(n1, 1, sort)
  n2 <- apply(n2, 1, sort)
  all(n1==n2)

  #Example 4: get all neighbors of a 3D graph based on 18 neighbors structure
  #           where the neighbors of a vertex comprise its available
  #           adjacencies sharing the same edges or faces.
  #           To achieve it, there are several ways, including the one below.

  n18 <- matrix(c(2,2,2,2,
                  0,2,2,2,
                  0,0,2,2), nrow=3, byrow=TRUE)  
  mask <- array(1, dim=rep(3,3))
  getNeighbors(mask, neiStruc=n18)
  
  



