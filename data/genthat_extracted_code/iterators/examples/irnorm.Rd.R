library(iterators)


### Name: irnorm
### Title: Random Number Iterators
### Aliases: irnorm irunif irbinom irnbinom irpois
### Keywords: utilities

### ** Examples

  # create an iterator that returns three random numbers
  it <- irnorm(1, count=3)
  nextElem(it)
  nextElem(it)
  nextElem(it)
  try(nextElem(it))  # expect a StopIteration exception



