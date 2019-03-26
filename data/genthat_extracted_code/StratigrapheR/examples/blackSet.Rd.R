library(StratigrapheR)


### Name: blackSet
### Title: Sets the plot environment to draw a long vertical data set
### Aliases: blackSet

### ** Examples

y <- c(0,11,19,33)
x <- c(1,2,2.5,4)

a <- min(y)
b <- max(y)

f<- encase(a-1,b,5)

blackSet(c(0,4),f, ytick = 10, ny = 10, skip = 1)

points(x, y, pch=19)



