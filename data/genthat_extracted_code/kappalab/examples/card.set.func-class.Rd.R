library(kappalab)


### Name: card.set.func-class
### Title: Class "card.set.func"
### Aliases: card.set.func-class
### Keywords: classes

### ** Examples

## a cardinal set function
mu <- card.set.func(-3:2)

# the attributes of the object
mu@n
mu@data

## some conversions that cannot work
## Not run: as.card.game(mu)
## Not run: as.card.capacityfunc(mu)

## the following should work
as.set.func(mu)

## some tests
is.cardinal(mu)
is.kadditive(mu,2)
is.monotone(mu)

## some transformations
conjugate(mu)
Mobius(mu)
## let us check ...
zeta(Mobius(mu))

## summary 
Shapley.value(mu)
interaction.indices(mu)
# the same
summary(mu)

## save the set function to a file
d <- to.data.frame(mu)
write.table(d,"my.card.set.func.csv",sep="\t")

# finally, some other conversions that should work
mu <- card.set.func(0:5)
as.card.game(mu)
as.card.capacity(mu)



