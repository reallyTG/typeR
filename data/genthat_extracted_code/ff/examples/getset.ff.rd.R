library(ff)


### Name: getset.ff
### Title: Reading and writing vectors of values (low-level)
### Aliases: getset.ff get.ff set.ff
### Keywords: IO data

### ** Examples

 x <- ff(0, length=12)
 get.ff(x, 3L)
 set.ff(x, 3L, 1)
 x
 set.ff(x, 3L, 1, add=TRUE)
 x
 getset.ff(x, 3L, 1, add=TRUE)
 getset.ff(x, 3L, 1)
 x
 rm(x); gc()



