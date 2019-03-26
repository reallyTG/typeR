library(itertools2)


### Name: icount
### Title: Iterator of neverending numeric sequence with initial value and
###   step size
### Aliases: icount

### ** Examples

it <- icount()
iterators::nextElem(it)
iterators::nextElem(it)
iterators::nextElem(it)

it2 <- icount(start=5.5, step=1.5)
iterators::nextElem(it2)
iterators::nextElem(it2)
iterators::nextElem(it2)



