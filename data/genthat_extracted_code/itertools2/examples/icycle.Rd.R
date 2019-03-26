library(itertools2)


### Name: icycle
### Title: Iterator that cycles indefinitely through an iterable object
### Aliases: icycle

### ** Examples

it <- icycle(1:3)
iterators::nextElem(it) # 1
iterators::nextElem(it) # 2
iterators::nextElem(it) # 3
iterators::nextElem(it) # 1
iterators::nextElem(it) # 2
iterators::nextElem(it) # 3
iterators::nextElem(it) # 1

it2 <- icycle(1:3, times=2)
as.list(it2)

# Can return the results from a function.
it3 <- icycle(function() rnorm(1))
iterators::nextElem(it)
iterators::nextElem(it)
iterators::nextElem(it)
iterators::nextElem(it)



