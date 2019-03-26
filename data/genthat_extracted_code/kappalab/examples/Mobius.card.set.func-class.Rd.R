library(kappalab)


### Name: Mobius.card.set.func-class
### Title: Class "Mobius.card.set.func"
### Aliases: Mobius.card.set.func-class
### Keywords: classes

### ** Examples

## the Mobius representation of a cardinal set function
a <- Mobius.card.set.func(-3:2)

# the attributes of the object
a@n
a@data

## some transformations
as.set.func(a)
zeta(a)
## let us check ...
Mobius(zeta(a))



