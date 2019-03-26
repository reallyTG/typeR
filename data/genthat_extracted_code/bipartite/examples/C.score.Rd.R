library(bipartite)


### Name: C.score
### Title: Calculates the (normalised) mean number of checkerboard
###   combinations (C-score) in a matrix
### Aliases: C.score
### Keywords: package

### ** Examples

m <- matrix(c(1,0,0, 1,1,0, 1,1,0, 0,1,1, 0,0,1), 5,3,TRUE)
C.score(m)
C.score(m, normalise=FALSE)
C.score(m, normalise=FALSE, FUN=print)




