library(kappalab)


### Name: show-methods
### Title: Methods for Function show in Package 'kappalab'
### Aliases: show-methods show,superclass.set.func-method
###   show,set.func-method show,Mobius.set.func-method
###   show,summary.superclass.set.func-method
###   show,summary.superclass.capacity-method
### Keywords: methods

### ** Examples

## a set function
mu <- set.func(0:15/15)
show(mu)
## the same
mu

## a Mobius transform
a <- Mobius.set.func(0:10,4,2)
show(a)
a

## a cardinal capacity
mu <- lower.capacity(5)
show(mu)
mu



