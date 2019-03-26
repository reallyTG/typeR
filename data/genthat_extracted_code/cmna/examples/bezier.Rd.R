library(cmna)


### Name: bezier
### Title: Bezier curves
### Aliases: bezier qbezier cbezier

### ** Examples

x <- c(1, 2, 3)
y <- c(2, 3, 5)
f <- qbezier(x, y, seq(0, 1, 1/100))

x <- c(-1, 1, 0, -2)
y <- c(-2, 2, -1, -1)
f <- cbezier(x, y, seq(0, 1, 1/100))




