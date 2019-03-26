library(Gifi)


### Name: plot.morals
### Title: Plot Methods for Morals
### Aliases: plot.morals
### Keywords: hplot

### ** Examples

x <- scale(as.matrix(seq(0, pi, length = 20)), scale = FALSE)
y <- scale(as.matrix(sin(x)), scale = FALSE)
fitxy <- morals(x, y, xknots = knotsGifi(x, "E"), xdegrees = 2)
plot(fitxy, main = c("x", "y"))
plot(fitxy, plot.type = "resplot")



