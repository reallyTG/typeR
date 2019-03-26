library(itertools)


### Name: ihasNext
### Title: Create an iterator that supports the hasNext method
### Aliases: ihasNext
### Keywords: utilities

### ** Examples

  it <- ihasNext(c('a', 'b', 'c'))
  while (hasNext(it))
    print(nextElem(it))



