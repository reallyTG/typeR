library(itertools)


### Name: ichunk
### Title: Create a chunking iterator
### Aliases: ichunk
### Keywords: utilities

### ** Examples

# Split the vector 1:10 into "chunks" with a maximum length of three
it <- ihasNext(ichunk(1:10, 3))
while (hasNext(it)) {
  print(unlist(nextElem(it)))
}

# Same as previous, but return integer vectors rather than lists
it <- ihasNext(ichunk(1:10, 3, mode='integer'))
while (hasNext(it)) {
  print(nextElem(it))
}



