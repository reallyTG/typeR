library(bayesImageS)


### Name: getBlocks
### Title: Get Blocks of a Graph
### Aliases: getBlocks
### Keywords: spatial

### ** Examples

  #Example 1: split a line into 2 blocks
  getBlocks(mask=c(1,1,1,1,0,0,1,1,0), nblock=2)
  
  #Example 2: split a 4*4 2D graph into 4 blocks in order
  #           to use the chequerboard idea for a neighbourhood structure
  #           corresponding to the second-order Markov random field.
  getBlocks(mask=matrix(1, nrow=4, ncol=4), nblock=4)
  
  #Example 3: split a 3*3*3 3D graph into 8 blocks
  #           in order to use the chequerboard idea for a neighbourhood
  #           structure based on the 18 neighbors definition, where the
  #           neighbors of a vertex comprise its available
  #           adjacencies sharing the same edges or faces.
  mask <- array(1, dim=rep(3,3))
  getBlocks(mask, nblock=8)



