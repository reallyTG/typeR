library(rotations)


### Name: project.SO3
### Title: Projection into SO(3)
### Aliases: project.SO3

### ** Examples

#Project an arbitrary 3x3 matrix into SO(3)
M<-matrix(rnorm(9), 3, 3)
project.SO3(M)

#Project a sample arithmetic mean into SO(3), same as 'mean'
Rs <- ruars(20, rcayley)
Rbar <- colSums(Rs)/nrow(Rs)
project.SO3(Rbar)              #The following is equivalent
mean(Rs)



