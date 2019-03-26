library(pracma)


### Name: isposdef
### Title: Positive Definiteness
### Aliases: isposdef
### Keywords: array

### ** Examples

A <- magic(5)
# isposdef(A)
## [1] FALSE
## Warning message:
## In isposdef(A) : Matrix 'A' is not symmetric.
## FALSE

A <- t(A) %*% A
isposdef(A)
## [1] TRUE

A[5, 5] <- 0
isposdef(A)
## [1] FALSE



