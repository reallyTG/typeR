library(Directional)


### Name: Simulation of random values from a von Mises-Fisher distribution
### Title: Random values simulation from a von Mises-Fisher distribution
### Aliases: rvmf
### Keywords: Random values simulation von Mises-Fisher distribution

### ** Examples

m <- rnorm(4)
m <- m/sqrt(sum(m^2))
x <- rvmf(100, m, 25)
m
vmf(x)



