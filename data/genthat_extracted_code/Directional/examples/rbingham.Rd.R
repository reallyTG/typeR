library(Directional)


### Name: Simulation from a Bingham distribution using any symmetric matrix A
### Title: Simulation from a Bingham distribution using any symmetric
###   matrix A
### Aliases: rbingham
### Keywords: Bingham distribution Simulation of random values

### ** Examples

A <- cov(iris[, 1:3])
x <- rbingham(100, A)



