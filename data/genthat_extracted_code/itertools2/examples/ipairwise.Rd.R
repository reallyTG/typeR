library(itertools2)


### Name: ipairwise
### Title: Iterator that returns elements of an object in pairs
### Aliases: ipairwise

### ** Examples

it <- ipairwise(iterators::iter(letters[1:4]))
iterators::nextElem(it) # list("a", "b")
iterators::nextElem(it) # list("b", "c")
iterators::nextElem(it) # list("c", "d")

it2 <- ipairwise(1:5)
iterators::nextElem(it2) # list(1, 2)
iterators::nextElem(it2) # list(2, 3)
iterators::nextElem(it2) # list(3, 4)
iterators::nextElem(it2) # list(4, 5)



