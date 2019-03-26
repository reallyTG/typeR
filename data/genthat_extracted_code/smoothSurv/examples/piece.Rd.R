library(smoothSurv)


### Name: piece
### Title: Left Continuous Piecewise Constant Function with a Finite
###   Support.
### Aliases: piece
### Keywords: utilities

### ** Examples

my.breaks <- c(-2, 1.5, 4, 7)
my.values <- c(0.5, 0.9, -2)
grid <- seq(-3, 8, by = 0.25)
piece(grid, my.breaks, my.values)



