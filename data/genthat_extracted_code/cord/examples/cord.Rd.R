library(cord)


### Name: cord
### Title: Community estimation in G-models via CORD
### Aliases: cord
### Keywords: cluster multivariate

### ** Examples

set.seed(100)
X <- 2*matrix(rnorm(200*2), 200, 10)+matrix(rnorm(200*10), 200, 10)
cord(X)



