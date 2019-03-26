library(matrixStats)


### Name: rowDiffs
### Title: Calculates difference for each row (column) in a matrix
### Aliases: rowDiffs colDiffs
### Keywords: array iteration robust univar

### ** Examples

x <- matrix(1:27, ncol = 3)

d1 <- rowDiffs(x)
print(d1)

d2 <- t(colDiffs(t(x)))
stopifnot(all.equal(d2, d1))



