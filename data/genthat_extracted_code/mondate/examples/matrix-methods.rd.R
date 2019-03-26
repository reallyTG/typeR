library(mondate)


### Name: matrix-methods
### Title: Matrix Methods for Mondate's
### Aliases: matrix-methods matrix,mondate-method matrix
### Keywords: methods

### ** Examples

m <- mondate.mdy(12, 31, 2001:2006) # 6 year-ends
matrix(m)                           # a one-column matrix
matrix(m, 2, byrow=TRUE)            # a two-row matrix stored in row-order



