library(kappalab)


### Name: Mobius.set.func-class
### Title: Class "Mobius.set.func"
### Aliases: Mobius.set.func-class
### Keywords: classes

### ** Examples

## the Mobius transform of a set function directly
a <- Mobius.set.func(1:16,4,4)

## the attributes of the object
a@n
a@k
a@data
a@subsets

## a set function
mu <- set.func(7:-8)
## and its Mobius transform
a <- Mobius(mu)

## some conversions that cannot work
## as.game(a)
## as.capacity(a)
## as.card.set.func(a)

## some tests
is.cardinal(a)
is.kadditive(a,2)
is.monotone(a)

## some transformations
zeta(a)
k.truncate.Mobius(a,2)

## summary 
Shapley.value(a)
interaction.indices(a)
# the same
summary(a)

## save the Mobius transform to a file
d <- to.data.frame(a)
write.table(d,"my.Mobius.set.func.csv",sep="\t")

# finally, some conversions that should work
mu <- set.func(c(0,1,1,1,2,2,2,3))
a <- Mobius(mu)
as.Mobius.game(a)
as.Mobius.capacity(a)
as.Mobius.card.set.func(a)



