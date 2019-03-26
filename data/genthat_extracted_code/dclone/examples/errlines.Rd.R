library(dclone)


### Name: errlines
### Title: Plot error bars
### Aliases: errlines errlines.default
### Keywords: aplot

### ** Examples

x <- 1:10
a <- rnorm(10,10)
a <- a[order(a)]
b <- runif(10)
y <- cbind(a-b, a+b+rev(b))
opar <- par(mfrow=c(2, 3))
plot(x, a, ylim = range(y))
errlines(x, y)
plot(x, a, ylim = range(y))
errlines(x, y, width = 0.5, code = 1)
plot(x, a, ylim = range(y), col = 1:10)
errlines(x, y, width = 0.5, code = 3, col = 1:10)
plot(x, a, ylim = range(y))
errlines(x, y, width = 0.5, code = 2, type = "b")
plot(x, a, ylim = range(y))
errlines(x, y, width = 0.5, code = 3, type = "b")
plot(x, a, ylim = range(y), type = "n")
errlines(x, y, width = 0.5, code = 3, type = "b", bg = 1:10)
errlines(x, cbind(a-b/2, a+b/2+rev(b)/2))
points(x, a)
par(opar)



