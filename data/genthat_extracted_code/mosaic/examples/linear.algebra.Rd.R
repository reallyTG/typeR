library(mosaic)


### Name: linear.algebra
### Title: Functions for teaching linear algebra.
### Aliases: linear.algebra mat singvals

### ** Examples

a <- c(1,0,0); b <- c(1,2,3); c <- c(4,5,6); x <- rnorm(3)
# Formula interface
mat(~a+b)
mat(~a+b+1)
if (require(mosaicData)) {
mat(~length+sex, data=KidsFeet)
singvals(~length*sex*width, data=KidsFeet)
}



