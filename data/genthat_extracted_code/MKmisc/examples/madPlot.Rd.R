library(MKmisc)


### Name: madPlot
### Title: Plot of similarity matrix based on MAD
### Aliases: madPlot
### Keywords: hplot

### ** Examples

## only a dummy example
set.seed(13)
x <- matrix(rnorm(1000), ncol = 10)
x[1:20,5] <- x[1:20,5] + 10
madPlot(x, new = TRUE, maxMAD = 2.5)
## in contrast
corPlot(x, new = TRUE, minCor = -0.5)



