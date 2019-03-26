library(kappalab)


### Name: Sipos.integral-methods
### Title: Sipos integral
### Aliases: Sipos.integral Sipos.integral-methods
###   Sipos.integral,Mobius.game,numeric-method
###   Sipos.integral,card.game,numeric-method
###   Sipos.integral,game,numeric-method
### Keywords: methods

### ** Examples

## a normalized capacity
mu <- capacity(c(0:13/13,1,1))

## and its Mobius transform
a <- Mobius(mu)

## a discrete function f
f <- c(0.1,-0.9,-0.3,0.8)

## the Sugeno integral of f w.r.t mu
Sipos.integral(mu,f)
Sipos.integral(a,f)

## a similar example with a cardinal capacity
mu <- uniform.capacity(4)
Sipos.integral(mu,f)



