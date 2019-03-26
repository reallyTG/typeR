library(secr)


### Name: subset.popn
### Title: Subset popn Object
### Aliases: subset.popn
### Keywords: manip

### ** Examples


temppop <- sim.popn (D = 10, expand.grid(x = c(0,100), y =
    c(0,100)), buffer = 50)
## 50% binomial sample of simulated population
temppops <- subset(temppop, runif(nrow(temppop)) < 0.5)
plot(temppop)
plot(temppops, add = TRUE, pch = 16)




