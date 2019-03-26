library(oce)


### Name: plotSticks
### Title: Draw a Stick Plot
### Aliases: plotSticks

### ** Examples


library(oce)

# Flow from a point source
n <- 16
x <- rep(0, n)
y <- rep(0, n)
theta <- seq(0, 2*pi, length.out=n)
u <- sin(theta)
v <- cos(theta)
plotSticks(x, y, u, v, xlim=c(-2, 2), ylim=c(-2, 2))
rm(n, x, y, theta, u, v)

# Oceanographic example
data(met)
t <- met[["time"]]
u <- met[["u"]]
v <- met[["v"]]
p <- met[["pressure"]]
oce.plot.ts(t, p)
plotSticks(t, 99, u, v, yscale=25, add=TRUE)



