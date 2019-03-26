library(ff)


### Name: fforder
### Title: Sorting: order from ff vectors
### Aliases: fforder
### Keywords: univar manip arith IO data

### ** Examples

   x <- ff(sample(1e5, 1e6, TRUE))
   y <- ff(sample(1e5, 1e6, TRUE))
   d <- ffdf(x, y)

   i <- fforder(y)
   y[i]
   i <- fforder(x, index=i)
   x[i]
   d[i,]

   i <- fforder(x, y)
   d[i,]

   i <- ffdforder(d)
   d[i,]

   rm(x, y, d, i)
   gc()



