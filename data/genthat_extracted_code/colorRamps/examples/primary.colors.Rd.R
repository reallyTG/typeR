library(colorRamps)


### Name: primary.colors
### Title: generates expanded sets of primary colors
### Aliases: primary.colors
### Keywords: color

### ** Examples

x <- matrix(rnorm(100), 10)
x <- sapply(1:10, function(i, x) cumsum(x[,i]), x=x)
par(mfrow = c(1, 2))
matplot(1:10, x, type = 'l', lty = 1, lwd = 3)
matplot(1:10, x, type = 'l', lty = 1, lwd = 3, col = primary.colors(10))



