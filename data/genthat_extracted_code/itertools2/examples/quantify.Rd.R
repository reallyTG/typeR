library(itertools2)


### Name: quantify
### Title: Count the number of times an iterable object is TRUE
### Aliases: quantify

### ** Examples

it <- iterators::iter(c(TRUE, FALSE, TRUE))
quantify(it) # 2

set.seed(42)
x <- sample(c(TRUE, FALSE), size=10, replace=TRUE)
quantify(x) # Equivalent to sum(x)



