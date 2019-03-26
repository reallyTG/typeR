library(kitagawa)


### Name: logsmoo
### Title: Logarithmic smoothing with loess
### Aliases: logsmoo

### ** Examples

set.seed(11133)
n <- 101
lx <- seq(-1,1,length.out=n)
y <- rnorm(n) + cumsum(rnorm(n))
plot(lx, y, col='grey')
lines(logsmoo(lx, y, x.is.log=TRUE))




