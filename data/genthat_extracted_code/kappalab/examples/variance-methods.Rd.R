library(kappalab)


### Name: variance-methods
### Title: Normalized variance of a capacity
### Aliases: variance variance-methods variance,Mobius.capacity-method
###   variance,capacity-method variance,card.capacity-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(c(0,0,0,0:12)/12)

## its Mobius transform
a <- Mobius(mu)

## their normalized variance
variance(mu)
variance(a)

## similar examples with card.capacity objects
mu <- lower.capacity(4)
variance(mu)
mu <- uniform.capacity(4)
variance(mu)



