library(Directional)


### Name: Habeck's rotation matrix generation
### Title: Generation of three-dimensional random rotations using Habeck's
###   algorithm.
### Aliases: habeck.rot

### ** Examples

F <- 10^(-1) *  matrix( c(85, 11, 41, 78, 39, 60, 43, 64, 48), ncol = 3 )  ## Arbitrary F matrix
X <- habeck.rot(F)
det(X)



