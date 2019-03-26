library(rbit)


### Name: BinaryIndexedTree
### Title: A simple implementation of Binary Indexed Tree as an R6 class.
### Aliases: BinaryIndexedTree
### Keywords: datasets

### ** Examples

tmp <- BinaryIndexedTree$new(c(2,3,2,5,1))
tmp$update(1,3)
tmp$query(1,5)
tmp$show.origin()
tmp$show.BIT()



