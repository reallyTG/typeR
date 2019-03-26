library(StratigrapheR)


### Name: whiteSet
### Title: Sets the plot environment to draw a long data set
### Aliases: whiteSet

### ** Examples

y <- c(0,11,19,33)
x <- c(1,2,2.5,4)

a <- min(y)
b <- max(y)

f <- encase(a-1,b,5)

whiteSet(c(0,4), f, ytick = 5, ny = 5, xaxs = "r")

points(x, y, pch=19)



