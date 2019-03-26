library(Gifi)


### Name: morals
### Title: Multiple Regression (MORALS).
### Aliases: morals
### Keywords: multivariate

### ** Examples

x <- scale(as.matrix(seq(0, pi, length = 20)), scale = FALSE)
y <- scale(as.matrix(sin(x)), scale = FALSE)
fitxy <- morals(x, y, xknots = knotsGifi(x, "E"), xdegrees = 2)
plot(fitxy, main = c("x", "y"))
plot(fitxy, plot.type = "resplot")

plot(fitxy$xhat, fitxy$yhat)
lines(fitxy$xhat, fitxy$ypred)

plot(x, fitxy$yhat)
lines(x, fitxy$ypred)



