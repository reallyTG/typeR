library(ff)


### Name: ffdfsort
### Title: Sorting: convenience wrappers for data.frames
### Aliases: dfsort dforder ramdfsort ramdforder ffdfsort ffdforder
### Keywords: univar manip arith IO data

### ** Examples

   x <- ff(sample(1e5, 1e6, TRUE))
   y <- ff(sample(1e5, 1e6, TRUE))
   z <- ff(sample(1e5, 1e6, TRUE))
   d <- ffdf(x, y, z)
   d2 <- ffdfsort(d)
   d2
   d
   d2 <- d[1:2]
   i <- ffdforder(d2)
   d[i,]
   rm(x, y, z, i, d, d2)
   gc()



