library(kappalab)


### Name: conjugate-methods
### Title: The conjugate (or dual) transform
### Aliases: conjugate conjugate-methods conjugate,capacity-method
###   conjugate,card.capacity-method conjugate,card.set.func-method
###   conjugate,set.func-method
### Keywords: methods

### ** Examples

## a game
mu <- game(c(0,-7:7))
mu

## its conjugate 
conjugate(mu)
## and mu again 
conjugate(conjugate(mu))

## a similar example with the upper capacity
mu <- capacity(c(0,rep(1,15)))
mu
conjugate(mu)
conjugate(conjugate(mu))

## a similar example with an object of class card.capacity
mu <- upper.capacity(6)
mu
conjugate(mu)
conjugate(conjugate(mu))

## the conjugate of a set function is a game
mu <- set.func(-7:8)
mu
conjugate(mu)
mu <- card.set.func(-2:5)
conjugate(mu)



