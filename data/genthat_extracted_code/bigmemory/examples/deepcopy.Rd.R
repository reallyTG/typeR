library(bigmemory)


### Name: deepcopy
### Title: Produces a physical copy of a "big.matrix"
### Aliases: deepcopy
### Keywords: methods

### ** Examples

x <- as.big.matrix(matrix(1:30, 10, 3))
y <- deepcopy(x, -1)    # Don't include the first column.
x
y
head(x)
head(y)



