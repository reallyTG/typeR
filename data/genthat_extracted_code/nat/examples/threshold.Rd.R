library(nat)


### Name: threshold
### Title: Threshold an object, typically to produce a mask
### Aliases: threshold threshold.im3d

### ** Examples

x=im3d(rnorm(1000),dims=c(10,10,10), BoundingBox=c(20,200,100,200,200,300))
stopifnot(all.equal(threshold(x, 0), threshold(x, x>0)))



