library(irtoys)


### Name: sim
### Title: Simulate response data
### Aliases: sim
### Keywords: models

### ** Examples


pa <- cbind(runif(20,.8,2), runif(20,-2.4,2.4), rep(0,50))
rs <- sim(ip=pa, x=rnorm(1000))




