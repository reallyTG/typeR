library(kappalab)


### Name: zeta-methods
### Title: The zeta transform
### Aliases: zeta zeta-methods zeta,Mobius.capacity-method
###   zeta,Mobius.card.set.func-method zeta,Mobius.game-method
###   zeta,Mobius.set.func-method
### Keywords: methods

### ** Examples

## the Mobius transform of a capacity
a <- Mobius.capacity(c(rep(0,15),1),4,4)
a

## its zeta transform
zeta(a)

## let us check
Mobius(zeta(a))

## a similar example with a Mobius.card.set.func object
mu <- card.set.func(-3:4)
a <- Mobius(mu)
zeta(a)



