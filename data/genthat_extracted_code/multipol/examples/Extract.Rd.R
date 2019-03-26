library(multipol)


### Name: Extract.multipol
### Title: Extract or Replace Parts of a multipol
### Aliases: Extract.multipol extract.multipol [.multipol [<-.multipol
### Keywords: array

### ** Examples

a <- as.multipol(matrix(1,4,6))
a[2,2] <- 100
a                  # coefficient of x1^2.x2^2 is 100

a[1:2,1:2]         # a matrix.  Note this corresponds to first and second powers
                   # not zeroth and first (what multipol would you want here?)

a[2,2]             # 100 to match the "a[2,2] <- 100" assignment above



