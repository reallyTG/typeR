library(sfsmisc)


### Name: diagX
### Title: The "Other" Diagonal Matrix
### Aliases: diagX
### Keywords: array utilities

### ** Examples

diagX(4)
for(m in 1:5)
  stopifnot(identical(diagX(m), diag(m)[, m:1, drop = FALSE]))



