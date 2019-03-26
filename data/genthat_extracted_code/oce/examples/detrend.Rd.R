library(oce)


### Name: detrend
### Title: Detrend a set of observations
### Aliases: detrend

### ** Examples


x <- seq(0, 0.9 * pi, length.out=50)
y <- sin(x)
y[1] <- NA
y[10] <- NA
plot(x, y, ylim=c(0, 1))
d <- detrend(x, y)
points(x, d$Y, pch=20)
abline(d$a, d$b, col='blue')
abline(h=0)
points(x, d$Y + d$a + d$b * x, col='blue', pch='+')



