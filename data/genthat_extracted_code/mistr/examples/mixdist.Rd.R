library(mistr)


### Name: mixdist
### Title: Creates an Object Representing Mixture Distribution
### Aliases: mixdist mixdist.dist mixdist.default

### ** Examples

# using the objects
M <- mixdist(normdist(1, 3), expdist(4), weights = c(0.7, 0.3))
M

# using the names and parameters
M2 <- mixdist(c("norm", "exp"), list(c(mean = 1, sd = 3), c(rate = 4)),
              weights = c(0.7, 0.3))
M2



