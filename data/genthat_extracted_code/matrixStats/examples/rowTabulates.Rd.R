library(matrixStats)


### Name: rowTabulates
### Title: Tabulates the values in a matrix by row (column)
### Aliases: rowTabulates colTabulates
### Keywords: utilities

### ** Examples

x <- matrix(1:5, nrow = 10, ncol = 5)
print(x)
print(rowTabulates(x))
print(colTabulates(x))
# Count only certain values
print(rowTabulates(x, values = 1:3))


y <- as.raw(x)
dim(y) <- dim(x)
print(y)
print(rowTabulates(y))
print(colTabulates(y))



