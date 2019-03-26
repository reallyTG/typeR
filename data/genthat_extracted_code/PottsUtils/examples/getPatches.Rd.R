library(PottsUtils)


### Name: getPatches
### Title: Get Patches of a Graph
### Aliases: getPatches
### Keywords: spatial

### ** Examples

  #Example 1: Find patches of a 3*3 2D graph with 6 bonds.

  bonds <- matrix(c(1,2,2,5,5,6,3,6,5,8,7,8), ncol=2, byrow=TRUE)
  getPatches(bonds, 9)



