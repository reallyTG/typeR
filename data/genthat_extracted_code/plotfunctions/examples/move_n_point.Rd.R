library(plotfunctions)


### Name: move_n_point
### Title: Move a vector n elements forward or backward.
### Aliases: move_n_point

### ** Examples

(x <- -10:30)
prev <- move_n_point(x)
change <- x - prev
post5 <- move_n_point(x, n=-5)

emptyPlot(length(x), range(x))
lines(x)
lines(prev, col='red')
lines(post5, col='blue')




