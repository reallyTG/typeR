library(itertools2)


### Name: ichunk
### Title: Iterator that returns elements in fixed-length chunks
### Aliases: ichunk

### ** Examples

it <- ichunk(iterators::iter(1:5), chunk_size=2)
# List: list(1, 2, 3)
iterators::nextElem(it)
# List: list(4, 5, NA)
iterators::nextElem(it)

it2 <- ichunk(levels(iris$Species), chunk_size=4, "weeee")
# Returns: list("setosa", "versicolor", "virginica", "weeee")
iterators::nextElem(it2)



