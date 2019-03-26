library(itertools2)


### Name: irepeat
### Title: Iterator that returns an object indefinitely
### Aliases: irepeat

### ** Examples

it <- irepeat(42)
iterators::nextElem(it)
iterators::nextElem(it)
iterators::nextElem(it)
# Further calls to iterators::nextElem(it) will repeat 42

it2 <- irepeat(42, times=4)
iterators::nextElem(it2)
iterators::nextElem(it2)
iterators::nextElem(it2)
iterators::nextElem(it2)

# The object can be a data.frame, matrix, etc
it3 <- irepeat(iris, times=4)
iterators::nextElem(it3)
iterators::nextElem(it3)
iterators::nextElem(it3)
iterators::nextElem(it3)



