library(kappalab)


### Name: favor-methods
### Title: Favor indices
### Aliases: favor favor-methods favor,Mobius.capacity-method
###   favor,capacity-method favor,card.capacity-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(c(0:13,13,13))

## its Mobius transform
a <- Mobius(mu)

## their favor indices
favor(mu)
favor(a)

## the same with a card.capacity object
mu <- lower.capacity(4)
favor(mu)



