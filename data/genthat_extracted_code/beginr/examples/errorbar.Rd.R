library(beginr)


### Name: errorbar
### Title: add error bars to a scatterplot.
### Aliases: errorbar

### ** Examples

x <- seq(0, 2 * pi, length.out = 100)
y <- sin(x)
plot(x, y, type = "l")
errorbar(x, y, yupper = 0.1, ylower = 0.1)




