library(kappalab)


### Name: orness-methods
### Title: Orness degree
### Aliases: orness orness-methods orness,Mobius.capacity-method
###   orness,capacity-method orness,card.capacity-method
### Keywords: methods

### ** Examples

## the upper capacity
mu <- capacity(c(0,rep(1,15)))

## the Choquet integral w.r.t mu behaves like the maximum operator
f <- c(0.1,0.1,0,0.9)
Choquet.integral(mu,f)

## its orness is 1
orness(mu)

## the same example with a Mobius.capacity object
a <- Mobius(mu)
Choquet.integral(a,f)
orness(a)

## the same example with a card.capacity object
mu <- upper.capacity(4)
Choquet.integral(mu,f)
orness(mu)



