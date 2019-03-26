library(itertools)


### Name: isplitCols
### Title: Create an iterator that splits a matrix into block columns
### Aliases: isplitCols
### Keywords: utilities

### ** Examples

# Split a matrix into submatrices with a maximum of three columns
x <- matrix(1:30, 3)
it <- ihasNext(isplitCols(x, chunkSize=3))
while (hasNext(it)) {
  print(nextElem(it))
}

# Split the same matrix into five submatrices
it <- ihasNext(isplitCols(x, chunks=5))
while (hasNext(it)) {
  print(nextElem(it))
}



