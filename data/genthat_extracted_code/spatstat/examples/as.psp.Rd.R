library(spatstat)


### Name: as.psp
### Title: Convert Data To Class psp
### Aliases: as.psp as.psp.psp as.psp.data.frame as.psp.matrix
###   as.psp.default
### Keywords: spatial manip

### ** Examples

   mat <- matrix(runif(40), ncol=4)
   mx <- data.frame(v1=sample(1:4,10,TRUE),
                    v2=factor(sample(letters[1:4],10,TRUE),levels=letters[1:4]))
   a <- as.psp(mat, window=owin(),marks=mx)
   mat <- cbind(as.data.frame(mat),mx)
   b <- as.psp(mat, window=owin()) # a and b are identical.
   stuff <- list(xmid=runif(10),
                 ymid=runif(10),
                 length=rep(0.1, 10),
                 angle=runif(10, 0, 2 * pi))
   a <- as.psp(stuff, window=owin())
   b <- as.psp(from=runifpoint(10), to=runifpoint(10))



