library(bit64)


### Name: identical.integer64
### Title: Identity function for class 'integer64'
### Aliases: identical.integer64
### Keywords: classes manip

### ** Examples

  i64 <- as.double(NA); class(i64) <- "integer64"
  identical(i64-1, i64+1)
  identical.integer64(i64-1, i64+1)



