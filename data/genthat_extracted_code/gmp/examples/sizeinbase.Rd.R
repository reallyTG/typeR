library(gmp)


### Name: sizeinbase
### Title: Compute size of a bigz in a base
### Aliases: sizeinbase
### Keywords: arith

### ** Examples

sizeinbase(342434, 10)# 6 obviously

Iv <- as.bigz(2:7)^500
sizeinbase(Iv)
stopifnot(sizeinbase(Iv)       == nchar(as.character(Iv)),
          sizeinbase(Iv, b=16) == nchar(as.character(Iv, b=16)))



