library(itertools2)


### Name: ilength
### Title: Consumes an iterator and computes its length
### Aliases: ilength

### ** Examples

ilength(1:5) == length(1:5)

it <- iterators::iter(1:5)
ilength(it) == length(1:5)

it2 <- ichain(1:3, 4:5, 6)
ilength(it2)

it3 <- ichain(1:3, levels(iris$Species))
ilength(it3)



