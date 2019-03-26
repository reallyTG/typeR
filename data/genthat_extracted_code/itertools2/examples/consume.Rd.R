library(itertools2)


### Name: consume
### Title: Consumes the first n elements of an iterator
### Aliases: consume

### ** Examples

it <- iterators::iter(1:10)
# Skips the first 5 elements
consume(it, n=5)
# Returns 6
iterators::nextElem(it)

it2 <- iterators::iter(letters)
# Skips the first 4 elements
consume(it2, 4)
# Returns 'e'
iterators::nextElem(it2)



