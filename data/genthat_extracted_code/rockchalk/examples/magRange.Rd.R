library(rockchalk)


### Name: magRange
### Title: magRange Magnify the range of a variable.
### Aliases: magRange

### ** Examples

x1 <- c(0, 0.5, 1.0)
range(x1)
magRange(x1, 1.1)
magRange(x1, c(1.1, 1.4))
magRange(x1, 0.5)
magRange(x1, c(0.1, 0.1))
x1 <- rnorm(100)
range(x1)
magRange(x1)
magRange(x1, 1.5)
magRange(x1, c(1,1.5))



