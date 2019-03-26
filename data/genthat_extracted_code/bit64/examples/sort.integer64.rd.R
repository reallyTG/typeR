library(bit64)


### Name: sort.integer64
### Title: High-level intger64 methods for sorting and ordering
### Aliases: sort.integer64 order.integer64
### Keywords: programming manip

### ** Examples

  x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
  x
  sort(x)
  message("the following has default optimize='time' which is faster but requires more RAM
, this calls 'ramorder'")
  order.integer64(x)
  message("slower with less RAM, this calls 'ramsortorder'")
  order.integer64(x, optimize="memory")



