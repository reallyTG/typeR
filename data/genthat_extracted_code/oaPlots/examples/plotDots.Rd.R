library(oaPlots)


### Name: plotDots
### Title: Adds Points on a Pre-existing Plot using Shifted Locations
### Aliases: plotDots

### ** Examples

x <- sample(1:5, size = 25, replace = TRUE)
plot(x = -1, y = -1, xlim = c(0.5,1.5), ylim = range(x),
    ylab = "", xlab = "", xaxt = "n")
colVec <- c(rep("olivedrab", 15), rep("goldenrod", 5), rep("red", 5))
plotDots(vec = x, xLeft = 0.8, xRight = 1.2, pch = 19,
    col = colVec, cex = 2)



