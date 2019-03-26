library(openintro)


### Name: ArrowLines
### Title: Create a Line That may have Arrows on the Ends
### Aliases: ArrowLines
### Keywords: Line Segment Algebra

### ** Examples

CCP(xlim=c(-6, 6), ylim=c(-6, 6), ticklabs=2)
x <- c(-2, 0, 2, 4)
y <- c(0, 3, 0, 3)
ArrowLines(x, y, col=COL[1], ends=c('c', 'c'))
points(x, y, col=COL[1], pch=19, cex=1.2)

CCP(xlim=c(-6, 6), ylim=c(-6, 6), ticklabs=2)
x <- c(-3, 0, 1, 3)
y <- c(2, 1, -2, 1)
ArrowLines(x, y, col=COL[1], ends=c('c', 'c'))
points(x, y, col=COL[1], pch=19, cex=1.2)

CCP(xlim=c(-6, 6), ylim=c(-6, 6), ticklabs=2)
x <- seq(-2, 2, 0.01)
y <- x^2 - 3
ArrowLines(x, y, col=COL[1], ends=c('c', 'c'))
x <- seq(-2, 2, 1)
y <- x^2 - 3
points(x, y, col=COL[1], pch=19, cex=1.2)



