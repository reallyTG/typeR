library(StepSignalMargiLike)


### Name: prior.norm.A
### Title: prior.norm.A
### Aliases: prior.norm.A

### ** Examples

library(StepSignalMargiLike)

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))

prior.norm.A(data.x)



