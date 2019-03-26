library(iterators)


### Name: isplit
### Title: Split Iterator
### Aliases: isplit
### Keywords: utilities

### ** Examples

x <- rnorm(200)
f <- factor(sample(1:10, length(x), replace=TRUE))

it <- isplit(x, f)
expected <- split(x, f)

for (i in expected) {
  actual <- nextElem(it)
  stopifnot(actual$value == i)
}



