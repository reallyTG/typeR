library(vtreat)


### Name: square_window
### Title: Build a square windows variable.
### Aliases: square_window

### ** Examples


d <- data.frame(x = c(NA, 1:6), y = c(0, 0, 0, 1, 1, 0, 0))
square_window("v", d$x, d$y)





