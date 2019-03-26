library(StepSignalMargiLike)


### Name: prior.pois
### Title: prior.pois
### Aliases: prior.pois

### ** Examples

n <- 20

data.x <- rpois(n, 1)
data.x <- c(data.x, rpois(n, 10))
data.x <- c(data.x, rpois(n, 50))
data.x <- c(data.x, rpois(n, 20))
data.x <- c(data.x, rpois(n, 80))

prior.pois(data.x)



