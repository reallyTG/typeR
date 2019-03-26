library(StepSignalMargiLike)


### Name: prior.norm.C
### Title: prior.norm.C
### Aliases: prior.norm.C

### ** Examples

library(StepSignalMargiLike)

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))

prior.norm.C(data.x)



