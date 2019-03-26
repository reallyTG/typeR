library(circular)


### Name: intersect.modal.region
### Title: Intersection between model region and a given interval.
### Aliases: intersect.modal.region intersect.modal.region.default
###   intersect.modal.region.circular

### ** Examples

  x <- rvonmises(100, circular(pi), 10)  
  res <- intersect.modal.region(x, breaks=circular(matrix(c(pi,pi+pi/12,
    pi-pi/12, pi), ncol=2, byrow=TRUE)), bw=50)
  res$tot

  x <- rvonmises(100, circular(0), 10)
  res <- intersect.modal.region(x, breaks=circular(matrix(c(pi,pi+pi/12),
    ncol=2)), bw=50)
  res$tot
  
  res <- intersect.modal.region(x, breaks=circular(matrix(c(pi/12,
    2*pi-pi/12), ncol=2, byrow=TRUE)), bw=50)
  res$tot



