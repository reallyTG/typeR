library(kappalab)


### Name: Mobius-methods
### Title: The Möbius transform
### Aliases: Mobius Mobius-methods Mobius,capacity-method
###   Mobius,card.set.func-method Mobius,game-method Mobius,set.func-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(0:15)
mu

## its Mobius transform
a <- Mobius(mu)
a

## its zeta transform
zeta(a)

## a similar example with a game object
mu <- game(c(0,-2:12))
mu
Mobius(mu)
zeta(Mobius(mu))

## a similar example with a set.func object
mu <- set.func(-7:8)
mu
Mobius(mu)
zeta(Mobius(mu))

## a similar example with a card.set.func object
mu <- card.set.func(-3:4)
mu
Mobius(mu)
zeta(Mobius(mu))



