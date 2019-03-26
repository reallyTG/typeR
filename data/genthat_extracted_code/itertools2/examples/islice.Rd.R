library(itertools2)


### Name: islice
### Title: Iterator that returns selected elements from an iterable.
### Aliases: islice

### ** Examples

it <- islice(1:5, start=2)
iterators::nextElem(it) # 2
iterators::nextElem(it) # 3
iterators::nextElem(it) # 4
iterators::nextElem(it) # 5

it2 <- islice(1:10, start=2, end=5)
unlist(as.list(it2)) == 2:5

it3 <- islice(1:10, start=2, end=9, step=2)
unlist(as.list(it3)) == c(2, 4, 6, 8)



