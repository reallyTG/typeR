library(spatstat)


### Name: Extract.tess
### Title: Extract or Replace Subset of Tessellation
### Aliases: [.tess [<-.tess
### Keywords: spatial manip

### ** Examples

   ## Don't show: 
op <- spatstat.options(npixel=10)
## End(Don't show)
   A <- tess(xgrid=0:4, ygrid=0:3)
   B <- A[c(1, 3, 7)]
   E <- A[-1]
   A[c(2, 5, 11)] <- NULL
   ## Don't show: 
spatstat.options(op)
## End(Don't show)



