library(cycloids)


### Name: zykloid
### Title: Core function for calculating coordinate representations of
###   hypocycloids, epicyloids, hypotrochoids, and epitrochoids (altogether
###   called 'cycloids' here)
### Aliases: zykloid
### Keywords: math graphs

### ** Examples


# Very simple example
cycl <- zykloid(A = 17, a = 9, lambda = 0.9, hypo = TRUE)
plot(y ~ x, data = cycl, asp = 1, type = "l")


# More complex: Looks like a passion flower
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-23, 23), ylim = c(-23, 23))
ll   <- seq(2, 0, -0.2)
ccol <- rep(c("lightblue", "lightgreen", "yellow", "yellow",
              "yellow"), 2)
for (i in c(1:length(ll))) {
     z <- zykloid(A = 15, a = 7, lambda = ll[i], hypo = TRUE)
     lines(y ~ x, data = z, col = ccol[i])
} # for i
par(op)


# Dense hypotrochoids
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5))
m <- zykloid(A = 90, a = 89, lambda = 0.01)
lines(y ~ x, data = m, col = "grey")
m <- zykloid(A = 90, a = 89, lambda = 0.02)
lines(y ~ x, data = m, col = "red")
m <- zykloid(A = 90, a = 89, lambda = 0.015)
lines(y ~ x, data = m, col = "blue")
par(op)


# Fragile star
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-14, 14), ylim = c(-14, 14))
l.max <- 1.6
l.min <- 0.1
ll <- seq(l.max, l.min, by = -1 * (l.max - l.min)/30)
n  <- length(ll)
ccol <- rainbow(n, start = 2/3, end = 1)
for (i in c(1:n)) {
    m <- zykloid(A = 9, a = 8, lambda = ll[i])
    lines(y ~ x, data = m, type = "l", col = ccol[i])
}  # for i
par(op)





