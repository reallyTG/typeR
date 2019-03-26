library(LaplacesDemon)


### Name: plotMatrix
### Title: Plot a Numerical Matrix
### Aliases: plotMatrix
### Keywords: Plot

### ** Examples

library(LaplacesDemon)
### Although it is most commonly used with an object of class
### posteriorchecks, it is applied here to a different correlation matrix.
data(mtcars)
plotMatrix(cor(mtcars), col=colorRampPalette(c("green","gray10","red"))(100),
     cex=1, circle=FALSE, order=TRUE)
plotMatrix(cor(mtcars), col=colorRampPalette(c("green","gray10","red"))(100),
     cex=1, circle=TRUE, order=TRUE)


