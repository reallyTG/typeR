library(matlib)


### Name: mpower
### Title: Matrix Power
### Aliases: mpower

### ** Examples

C <- matrix(c(1,2,3,2,5,6,3,6,10), 3, 3) # nonsingular, symmetric
C
mpower(C, 2)
zapsmall(mpower(C, -1))
solve(C)    # check



