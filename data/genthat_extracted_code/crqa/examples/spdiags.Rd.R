library(crqa)


### Name: spdiags
### Title: Extract diagonal matrices
### Aliases: spdiags
### Keywords: array

### ** Examples


dta <- c(0, 5, 0, 10, 0, 0, 0, 0, 6, 0, 11, 0, 3, 0, 0,
7, 0, 12, 1, 4, 0, 0, 8, 0, 0, 2, 5, 0, 0, 9)

A1 <- matrix(dta, nrow=5, ncol=6, byrow=TRUE)

print(A1)
res1 <- spdiags(A1)
print(res1) 




