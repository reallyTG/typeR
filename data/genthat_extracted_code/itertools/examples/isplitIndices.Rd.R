library(itertools)


### Name: isplitIndices
### Title: Create an iterator of indices
### Aliases: isplitIndices
### Keywords: utilities

### ** Examples

# Return indices from 1 to 17 in vectors no longer than five
it <- ihasNext(isplitIndices(17, chunkSize=5))
while (hasNext(it)) {
  print(nextElem(it))
}

# Return indices from 1 to 7 in four vectors
it <- ihasNext(isplitIndices(7, chunks=4))
while (hasNext(it)) {
  print(nextElem(it))
}



