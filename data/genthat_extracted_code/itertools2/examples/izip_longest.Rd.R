library(itertools2)


### Name: izip_longest
### Title: Iterator that iterates through several iterables concurrently.
### Aliases: izip_longest

### ** Examples

it <- izip_longest(x=1:3, y=4:6, z=7:9)
iterators::nextElem(it) # list(x=1, y=4, z=7)
iterators::nextElem(it) # list(x=2, y=5, z=8)
iterators::nextElem(it) # list(x=3, y=6, z=9)

it2 <- izip_longest(1:3, 4:8)
iterators::nextElem(it2) # list(1, 4)
iterators::nextElem(it2) # list(2, 5)
iterators::nextElem(it2) # list(3, 6)
iterators::nextElem(it2) # list(NA, 7)
iterators::nextElem(it2) # list(NA, 8)

it3 <- izip_longest(1:2, 4:7, levels(iris$Species), fill="w00t")
iterators::nextElem(it3) # list(1, 4, "setosa")
iterators::nextElem(it3) # list(2, 5, "versicolor")
iterators::nextElem(it3) # list("w00t", 6, "virginica")
iterators::nextElem(it3) # list("w00t", 7, "w00t")



