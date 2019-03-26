library(iterators)


### Name: idiv
### Title: Dividing Iterator
### Aliases: idiv
### Keywords: utilities

### ** Examples

  # divide the value 10 into 3 pieces
  it <- idiv(10, chunks=3)
  nextElem(it)
  nextElem(it)
  nextElem(it)
  try(nextElem(it))  # expect a StopIteration exception

  # divide the value 10 into pieces no larger than 3
  it <- idiv(10, chunkSize=3)
  nextElem(it)
  nextElem(it)
  nextElem(it)
  nextElem(it)
  try(nextElem(it))  # expect a StopIteration exception



