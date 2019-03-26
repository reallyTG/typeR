library(kappalab)


### Name: normalize-methods
### Title: Normalizes a capacity.
### Aliases: normalize normalize-methods normalize,Mobius.capacity-method
###   normalize,capacity-method normalize,card.capacity-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(0:15)

## normalize it
is.normalized(mu)
normalize(mu)

## a similar example with a Mobius.capacity object
a <- Mobius(mu)
is.normalized(a)
normalize(a)
zeta(normalize(a))

## a similar example with a card.capacity object
mu <- card.capacity(0:6)
is.normalized(mu)
normalize(mu)
Mobius(normalize(mu))




