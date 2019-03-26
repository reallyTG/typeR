library(kappalab)


### Name: Sugeno.integral-methods
### Title: Sugeno integral
### Aliases: Sugeno.integral Sugeno.integral-methods
###   Sugeno.integral,Mobius.game,numeric-method
###   Sugeno.integral,card.game,numeric-method
###   Sugeno.integral,game,numeric-method
### Keywords: methods

### ** Examples

## a normalized capacity
mu <- capacity(c(0:13/13,1,1))

## and its Mobius transform
a <- Mobius(mu)

## a discrete function f
f <- c(0.1,0.9,0.3,0.8)

## the Sugeno integral of f w.r.t mu
Sugeno.integral(mu,f)
Sugeno.integral(a,f) 

## a similar example with a cardinal capacity
mu <- uniform.capacity(4)
Sugeno.integral(mu,f)



