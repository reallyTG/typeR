library(CoopGame)


### Name: webersetVertices
### Title: Compute vertices of Weber Set
### Aliases: webersetVertices

### ** Examples

library(CoopGame)
webersetVertices(c(0,0,0,1,1,1,2))

## No test: 
#Example of a 3-player TU game (with a Weber Set with 6 vertices)
library(CoopGame)
v = c(0,1,2,3,4,5,6)
webersetVertices(v)

#Example of a 4-player TU game (with a Weber Set with 14 vertices)
library(CoopGame)
v = c(5,2,4,7,15,15,15,15,15,15,20,20,20,20,35)
webersetVertices(v)
## End(No test)




