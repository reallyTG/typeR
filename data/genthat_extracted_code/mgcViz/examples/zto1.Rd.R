library(mgcViz)


### Name: zto1
### Title: Constructing a decreasing function from (0,1) to (0,1)
### Aliases: zto1

### ** Examples

library(mgcViz)
x <- seq(0, 1, by = 0.01)
plot(x, zto1(0.05, 2, 0.1)(x), ylim = c(0, 1), type = 'l')
lines(x, zto1(0.05, 1, 0.2)(x), col = 2)
lines(x, zto1(0.1, 3, 0)(x), col = 3)



