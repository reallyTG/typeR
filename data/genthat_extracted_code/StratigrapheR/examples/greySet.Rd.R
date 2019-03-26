library(StratigrapheR)


### Name: greySet
### Title: Sets the plot environment to draw a long vertical data set
### Aliases: greySet

### ** Examples

y <- c(0,11,19,33)
x <- c(1,2,2.5,4)

a <- min(y)
b <- max(y)

f<- encase(a-1,b,5)

greySet(c(0,4),f,abbr="abbr", ytick = 10, ny = 10)

points(x, y, pch=19)



