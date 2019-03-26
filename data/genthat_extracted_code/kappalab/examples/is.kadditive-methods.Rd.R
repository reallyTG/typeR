library(kappalab)


### Name: is.kadditive-methods
### Title: Test method
### Aliases: is.kadditive is.kadditive-methods
###   is.kadditive,Mobius.set.func,numeric-method
###   is.kadditive,card.set.func,numeric-method
###   is.kadditive,set.func,numeric-method
### Keywords: methods

### ** Examples

## a set function
mu <- set.func(c(0,1,1,1,2,2,2,3))
mu
is.kadditive(mu,2)
is.kadditive(mu,1)

## the Mobius representation of a set function, 2-additive by construction 
a <- Mobius.set.func(c(0,1,2,1,3,1,2,1,2,3,1),4,2)
is.kadditive(a,2)
is.kadditive(a,1)



