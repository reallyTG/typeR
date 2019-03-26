library(BBmisc)


### Name: getMaxIndexOfRows
### Title: Find row- or columnwise the index of the maximal / minimal
###   element in a matrix.
### Aliases: getMaxIndexOfRows getMinIndexOfRows getMaxIndexOfCols
###   getMinIndexOfCols

### ** Examples

x = matrix(runif(5 * 3), ncol = 3)
print(x)
print(getMaxIndexOfRows(x))
print(getMinIndexOfRows(x))



