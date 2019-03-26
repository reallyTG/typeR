library(dtt)


### Name: mvdtt
### Title: 2D Discrete Trigonometric Transforms
### Aliases: mvdtt mvdct mvdst mvdht
### Keywords: models

### ** Examples

x = rnorm(100);
dim(x) = c(10,10);
x
mvdct(x)
mvdct(mvdct(x),inverted=TRUE)



