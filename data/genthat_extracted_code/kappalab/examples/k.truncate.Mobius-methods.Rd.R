library(kappalab)


### Name: k.truncate.Mobius-methods
### Title: k-order truncation of the Möbius representation of a set
###   function.
### Aliases: k.truncate.Mobius k.truncate.Mobius-methods
###   k.truncate.Mobius,set.func,numeric-method
###   k.truncate.Mobius,Mobius.set.func,numeric-method
### Keywords: methods

### ** Examples

## a set function
mu <- set.func(c(0,1,1,1,2,2,2,3))
mu

## 2-truncate it
k.truncate.Mobius(mu,2)
## 2-truncate it
k.truncate.Mobius(Mobius(mu),2)



