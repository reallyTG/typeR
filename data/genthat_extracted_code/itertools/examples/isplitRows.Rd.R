library(itertools)


### Name: isplitRows
### Title: Create an iterator that splits a matrix into block rows
### Aliases: isplitRows
### Keywords: utilities

### ** Examples

# Split a matrix into submatrices with a maximum of three rows
x <- matrix(1:100, 10)
it <- ihasNext(isplitRows(x, chunkSize=3))
while (hasNext(it)) {
  print(nextElem(it))
}

# Split the same matrix into five submatrices
it <- ihasNext(isplitRows(x, chunks=5))
while (hasNext(it)) {
  print(nextElem(it))
}



