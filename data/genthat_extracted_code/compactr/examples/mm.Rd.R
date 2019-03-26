library(compactr)


### Name: mm
### Title: Find the minimum and maximum of a vector
### Aliases: mm

### ** Examples

x <- rnorm(100)
y <- rnorm(100)

par(mfrow = c(1,1), mar = c(5,4,4,2), oma = c(0,0,0,0))
eplot(x, y, xlim = mm(x), ylim = mm(y))



