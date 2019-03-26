library(BBEST)


### Name: trim.data
### Title: Truncate data
### Aliases: trim.data
### Keywords: set data

### ** Examples

# prepare data
x <- seq(0, 50, 0.01)
y <- .8*exp(-x)*x^4 
dat <- list(x=x, y=y)
# truncate
dat <- trim.data(dat, 1, 25)
# plot results
plot(x,y,t="l",lwd=4, col=4)
lines(dat$x, dat$y, lwd=4, col=2)
legend(15,3,c("initial", "truncated"), lty=1, col=c(4,2))



