library(ChemoSpecUtils)


### Name: check4Gaps
### Title: Check for Discontinuities (Gaps) in a Vector & Optionally Make a
###   Plot
### Aliases: check4Gaps
### Keywords: utilities

### ** Examples


x <- seq(0, 2*pi, 0.1)
y <- sin(x)
remove <- c(8:11, 40:45)
x <- x[-remove]
y <- y[-remove]
gaps <- check4Gaps(x, tol = 0.11) # tol just larger than orig spacing
gaps
gaps <- check4Gaps(x, y, tol = 0.11) # show a plot if y given




