library(wrapr)


### Name: orderv
### Title: Order by a list of vectors.
### Aliases: orderv

### ** Examples


d <- data.frame(x = c(2, 2, 3, 3, 1, 1), y = 6:1)
d[order(d$x, d$y), , drop = FALSE]
d[orderv(d), , drop = FALSE]




