library(StepSignalMargiLike)


### Name: prior.norm.B
### Title: prior.norm.B
### Aliases: prior.norm.B

### ** Examples

library(StepSignalMargiLike)

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))

prior.norm.B(data.x)



