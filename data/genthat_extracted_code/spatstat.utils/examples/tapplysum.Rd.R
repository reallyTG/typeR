library(spatstat.utils)


### Name: tapplysum
### Title: Sum By Factor Level
### Aliases: tapplysum
### Keywords: arith utilities

### ** Examples

   x <- 1:12
   a <- factor(rep(LETTERS[1:2], each=6))
   b <- factor(rep(letters[1:4], times=3))
   ff <- list(a, b)
   tapply(x, ff, sum)
   tapplysum(x, ff, do.names=TRUE)
   tapplysum(x + 2i, ff, do.names=TRUE)



