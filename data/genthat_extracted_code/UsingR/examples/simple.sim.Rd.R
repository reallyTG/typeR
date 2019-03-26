library(UsingR)


### Name: simple.sim
### Title: Simplify the process of simulation
### Aliases: simple.sim
### Keywords: univar datagen

### ** Examples

## First shows trivial (and very unnecessary usage)
## define a function f and then simulate
f<-function() rnorm(1)     # create a single random real number
sim <- simple.sim(100,f)   # create 100 random normal numbers
hist(sim)

## what does range look like?
f<- function (n,mu=0,sigma=1) {
  tmp <- rnorm(n,mu,sigma)
  max(tmp) - min(tmp)
}
sim <- simple.sim(100,f,5)
hist(sim)



