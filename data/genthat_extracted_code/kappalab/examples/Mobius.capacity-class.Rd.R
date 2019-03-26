library(kappalab)


### Name: Mobius.capacity-class
### Title: Class "Mobius.capacity"
### Aliases: Mobius.capacity-class
### Keywords: classes

### ** Examples

## a capacity
mu <- capacity(c(0,0,0:13))
## and its Mobius representation
a <- Mobius(mu)
a

# the attributes of object a
a@n
a@k
a@data
a@subsets

## a test
is.normalized(a)
## normalize it
normalize(a)

## a transformation
zeta(a)
## Let us check ...
Mobius(zeta(a))

## some summary indices
orness(a)
veto(a)
favor(a)
variance(a)
entropy(a)
## the same
summary(a)



