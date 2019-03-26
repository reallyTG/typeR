library(MLEcens)


### Name: plotRects
### Title: Plot a set of rectangles
### Aliases: plotRects
### Keywords: hplot aplot

### ** Examples

n <- 10
x <- c(0:(n-1))
R <- cbind(x,x+3,x,x+3)  # first rectangle is (0,3)x(0,3), 
                         # second rectangle is (1,4)x(1,4), etc...
par(mfrow=c(1,1))
plotRects(R,main="Example")



