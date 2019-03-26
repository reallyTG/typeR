library(sitree)


### Name: toBindLists
### Title: Binding lists
### Aliases: toBindLists

### ** Examples

## Example of how toBindLists works with data frames
x <- data.frame(1:10, ncol = 2)
names(x) <- c('a', 'b')
y <- data.frame(1:20, ncol = 2)
names(y) <- names(x)
j <- toBindLists(x, y)
j

## with vectors
x <- c(1:3)
y <- (8:15)
j <- toBindLists(x, y)
j

## with lists
x <- data.frame(1:10, ncol = 2)
names(x) <- c('a', 'b')
y <- data.frame(1:20, ncol = 2)
names(y) <- names(x)

x <- list(x = x, y = y)

xx <- data.frame(1:10, ncol = 3)
names(xx) <- c('a', 'b')
yy <- data.frame(1:20, ncol = 3)
names(yy) <- names(xx)

y <- list(xx = xx, yy= yy)

j <- toBindLists(x, y)
j



