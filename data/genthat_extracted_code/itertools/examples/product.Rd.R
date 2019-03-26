library(itertools)


### Name: product
### Title: Create a cartesian product iterator
### Aliases: product
### Keywords: utilities

### ** Examples

# Simulate a doubly-nested loop with a single while loop
it <- ihasNext(product(a=1:3, b=1:2))
while (hasNext(it)) {
  x <- nextElem(it)
  cat(sprintf('a = %d, b = %d\n', x$a, x$b))
}



