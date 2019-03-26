library(iterators)


### Name: icount
### Title: Counting Iterators
### Aliases: icount icountn
### Keywords: utilities

### ** Examples

  # create an iterator that counts from 1 to 3.
  it <- icount(3)
  nextElem(it)
  nextElem(it)
  nextElem(it)
  try(nextElem(it))  # expect a StopIteration exception



