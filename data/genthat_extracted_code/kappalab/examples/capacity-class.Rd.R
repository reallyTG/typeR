library(kappalab)


### Name: capacity-class
### Title: Class "capacity"
### Aliases: capacity-class
### Keywords: classes

### ** Examples

## a capacity
mu <- capacity(c(0:13,13,13)/13)

## the attributes of the object
mu@n
mu@data
mu@subsets

## a test
is.normalized(mu)
normalize(mu)

## a conversion that should not work
## as.card.capacity(mu)

## some transformations
conjugate(mu)
Mobius(mu)
## let us check ...
zeta(Mobius(mu))

## some summary indices
orness(mu)
veto(mu)
favor(mu)
variance(mu)
entropy(mu)
## the same
summary(mu)



