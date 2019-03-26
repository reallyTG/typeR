library(Directional)


### Name: Simulation from a Matrix Fisher distribution on SO(3)
### Title: Simulation from a Matrix Fisher distribution on SO(3)
### Aliases: rmatrixfisher

### ** Examples

F <- matrix( c(85, 11, 41, 78, 39, 60, 43, 64, 48), ncol = 3) / 10   ### An arbitrary F matrix
a <- rmatrixfisher(10, F)



