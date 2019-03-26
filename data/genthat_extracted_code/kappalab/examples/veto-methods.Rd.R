library(kappalab)


### Name: veto-methods
### Title: Veto indices
### Aliases: veto veto-methods veto,Mobius.capacity-method
###   veto,capacity-method veto,card.capacity-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(c(0:13,13,13)/13)

## its Mobius transform
a <- Mobius(mu)

## their veto indices
veto(mu)
veto(a)

## the same with a card.capacity object
mu <- lower.capacity(4)
veto(mu)



