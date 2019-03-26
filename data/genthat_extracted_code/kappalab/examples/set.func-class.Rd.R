library(kappalab)


### Name: set.func-class
### Title: Class "set.func"
### Aliases: set.func-class
### Keywords: classes

### ** Examples

## a set function
mu <- set.func(c(1:8,8:1)/8)

## the attributes of the object
mu@n
mu@data
mu@subsets

## some conversions that cannot work
## Not run: as.game(mu)
## Not run: as.capacity(mu)
## Not run: as.card.set.func(mu)

## some tests
is.cardinal(mu)
is.kadditive(mu,2)
is.monotone(mu)

## some transformations
conjugate(mu)
Mobius(mu)
k.truncate.Mobius(mu,2)

## summary 
Shapley.value(mu)
interaction.indices(mu)
# the same
summary(mu)

## save the set function to a file
d <- to.data.frame(mu)
write.table(d,"my.set.func.csv",sep="\t")

# finally, some conversions that should work
mu <- set.func(c(0,1,1,1,2,2,2,3))
as.game(mu)
as.capacity(mu)
as.card.set.func(mu)



