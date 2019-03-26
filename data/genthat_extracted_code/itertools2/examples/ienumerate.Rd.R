library(itertools2)


### Name: ienumerate
### Title: Iterator that returns the elements of an object along with their
###   indices
### Aliases: ienum ienumerate

### ** Examples

set.seed(42)
it <- ienumerate(rnorm(5))
as.list(it)

# Iterates through the columns of the iris data.frame
it2 <- ienum(iris)
iterators::nextElem(it2)
iterators::nextElem(it2)
iterators::nextElem(it2)
iterators::nextElem(it2)
iterators::nextElem(it2)



