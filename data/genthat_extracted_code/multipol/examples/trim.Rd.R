library(multipol)


### Name: trim
### Title: Remove redundant entries from a multipol
### Aliases: trim taylor
### Keywords: array

### ** Examples

a <- matrix(0,7,7)
a[1:3,1:4] <- 1:12
a <- as.multipol(a)
a
trim(a)
taylor(a,2)



