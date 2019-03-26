library(trajr)


### Name: TrajGenerate
### Title: Generate a random trajectory
### Aliases: TrajGenerate

### ** Examples

# Generate a 1000 step correlated random walk
trj <- TrajGenerate()
plot(trj, main = "Correlated walk")

# Generate a 1000 step levy flight - paths lengths follow a cauchy distribution
trj <- TrajGenerate(linearErrorDist = rcauchy)
plot(trj, main = "Levy flight")

# Generate a short directed trajectory
trj <- TrajGenerate(n = 20, random = FALSE)
plot(trj, main = "Directed walk")

# Generate an uncorrelated random walk
trj <- TrajGenerate(500, angularErrorDist = function(n) runif(n, -pi, pi))
plot(trj, main = "Uncorrelated walk")




