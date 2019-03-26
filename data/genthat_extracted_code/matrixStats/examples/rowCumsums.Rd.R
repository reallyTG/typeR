library(matrixStats)


### Name: rowCumsums
### Title: Cumulative sums, products, minima and maxima for each row
###   (column) in a matrix
### Aliases: rowCumsums colCumsums rowCumprods colCumprods rowCummins
###   colCummins rowCummaxs colCummaxs
### Keywords: array iteration univar

### ** Examples

x <- matrix(1:12, nrow = 4, ncol = 3)
print(x)

yr <- rowCumsums(x)
print(yr)

yc <- colCumsums(x)
print(yc)

yr <- rowCumprods(x)
print(yr)

yc <- colCumprods(x)
print(yc)

yr <- rowCummaxs(x)
print(yr)

yc <- colCummaxs(x)
print(yc)

yr <- rowCummins(x)
print(yr)

yc <- colCummins(x)
print(yc)



