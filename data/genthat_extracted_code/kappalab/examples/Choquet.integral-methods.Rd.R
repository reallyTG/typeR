library(kappalab)


### Name: Choquet.integral-methods
### Title: Choquet integral
### Aliases: Choquet.integral Choquet.integral-methods
###   Choquet.integral,Mobius.game,numeric-method
###   Choquet.integral,card.game,numeric-method
###   Choquet.integral,game,numeric-method
### Keywords: methods

### ** Examples

## a normalized capacity
mu <- capacity(c(0:13/13,1,1))

## and its Mobius transform
a <- Mobius(mu)

## a discrete positive function f
f <- c(0.1,0.9,0.3,0.8)

## the Choquet integral of f w.r.t mu
Choquet.integral(mu,f)
Choquet.integral(a,f)

## a similar example with a cardinal capacity
mu <- uniform.capacity(4)
Choquet.integral(mu,f)



