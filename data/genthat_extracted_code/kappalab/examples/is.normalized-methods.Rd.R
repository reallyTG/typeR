library(kappalab)


### Name: is.normalized-methods
### Title: Test method
### Aliases: is.normalized is.normalized-methods
###   is.normalized,Mobius.capacity-method is.normalized,capacity-method
###   is.normalized,card.capacity-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(0:15)
is.normalized(mu)
normalize(mu)

## its Mobius transform
a <- Mobius(mu)
is.normalized(a)
normalize(a)

## a cardinal capacity
mu <- uniform.capacity(7)
is.normalized(mu)



