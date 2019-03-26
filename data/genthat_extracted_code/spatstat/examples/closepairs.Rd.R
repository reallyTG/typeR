library(spatstat)


### Name: closepairs
### Title: Close Pairs of Points
### Aliases: closepairs crosspairs closepairs.ppp crosspairs.ppp
###   closepaircounts crosspaircounts
### Keywords: spatial math

### ** Examples

   a <- closepaircounts(cells, 0.1)
   sum(a)

   Y <- split(amacrine)
   b <- crosspaircounts(Y$on, Y$off, 0.1)

   d <- closepairs(cells, 0.1)
   e <- crosspairs(Y$on, Y$off, 0.1)



