library(qcc)


### Name: ewmaSmooth
### Title: EWMA smoothing function
### Aliases: ewmaSmooth
### Keywords: hplot

### ** Examples

x <- 1:50
y <- rnorm(50, sin(x/5), 0.5)
plot(x,y)
lines(ewmaSmooth(x,y,lambda=0.1), col="red")



