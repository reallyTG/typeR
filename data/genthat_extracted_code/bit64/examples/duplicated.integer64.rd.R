library(bit64)


### Name: duplicated.integer64
### Title: Determine Duplicate Elements of integer64
### Aliases: duplicated.integer64
### Keywords: logic manip

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
duplicated(x)

stopifnot(identical(duplicated(x),  duplicated(as.integer(x))))



