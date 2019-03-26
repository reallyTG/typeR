library(Directional)


### Name: Summary statistics for grouped circular data
### Title: Summary statistics for grouped circular data
### Aliases: group.vm
### Keywords: Summary statistics Von Mises distribution Grouped data

### ** Examples

x <- rvonmises(200, 3, 10)
a <- circ.summary(x, rads = TRUE, plot = FALSE)
group <- seq(min(x) - 0.1, max(x) + 0.1, length = 6)
y <- cut(x, breaks = group, length = 6)
group <- matrix( c( group[1], rep(group[2:5], each = 2), group[6]), ncol = 2, byrow = TRUE)
fi <- as.vector( table(y) )
b <- group.vm(group, fi, rads = TRUE)
a
b



