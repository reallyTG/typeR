library(binGroup)


### Name: sim.gt
### Title: Simulation Function for Group Testing Data
### Aliases: sim.gt
### Keywords: datagen

### ** Examples


set.seed(46)
gt.data <- sim.gt(par = c(-12, 0.2), sample.size = 700, group.size = 5)

x1 <- sort(runif(100, 0, 30))
x2 <- rgamma(100, shape=17, scale=1.5)
gt.data <- sim.gt(x = cbind(x1,x2), par=c(-14, 0.2, 0.3),
 group.size = 4, sens = 0.98, spec = 0.98)




