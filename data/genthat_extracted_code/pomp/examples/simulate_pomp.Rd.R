library(pomp)


### Name: POMP simulation
### Title: Simulations of a partially-observed Markov process
### Aliases: 'POMP simulation' simulate,missing-method simulate,ANY-method
###   simulate,pomp-method simulate-pomp
### Keywords: models ts

### ** Examples

pompExample(ou2)
x <- simulate(ou2,seed=3495485,nsim=10)
x <- simulate(ou2,seed=3495485,nsim=10,states=TRUE,obs=TRUE)
x <- simulate(ou2,seed=3495485,nsim=10,obs=TRUE,
              as.data.frame=TRUE,include.data=TRUE)



