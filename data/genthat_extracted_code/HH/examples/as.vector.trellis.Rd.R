library(HH)


### Name: as.vector.trellis
### Title: Convert a two-dimensional trellis object into a one-dimensional
###   trellis object. Change the order of panels in a trellis object.
### Aliases: as.vector.trellis reorder.trellis
### Keywords: dplot

### ** Examples

tmp <- data.frame(a=letters[c(1:3,1:3,1:3)],
                  b=1:9,
                  d=1:9,
                  e=LETTERS[c(4,4,4,5,5,5,6,6,6)])
tmp
a6 <- xyplot(b ~ d | a*e, data=tmp, pch=19)
a6
dim(a6)
a62 <- as.vector(a6)
a62
dim(a62)
a63 <- reorder(a6, c(1,4,7, 2,5,8, 3,6,9))
a63
dim(a63)
a64 <- matrix.trellis(a63, nrow=3, ncol=3, dimnames=dimnames(a6), byrow=TRUE)
a64
dim(a64)



