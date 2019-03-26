library(kappalab)


### Name: card.capacity-class
### Title: Class "card.capacity"
### Aliases: card.capacity-class
### Keywords: classes

### ** Examples

## a capacity
mu <- card.capacity(0:6/6)
## the same
mu <- uniform.capacity(6)

# the attributes of the object
mu@n
mu@data

## a test
is.normalized(mu)
normalize(mu)

## a transformation
conjugate(mu)

## some summary indices
orness(mu)
veto(mu)
favor(mu)
variance(mu)
entropy(mu)
## the same
summary(mu)



