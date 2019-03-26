library(ff)


### Name: ffsort
### Title: Sorting of ff vectors
### Aliases: ffsort
### Keywords: univar manip arith IO data

### ** Examples

   n <- 1e6
   x <- ff(c(NA, 999999:1), vmode="double", length=n)
   x <- ffsort(x)
   x
   is.sorted(x)
   na.count(x)
   x <- ffsort(x, decorate=TRUE)
   is.sorted(x)
   na.count(x)
   x <- ffsort(x, BATCHBYTES=n, VERBOSE=TRUE)



