library(simpleboot)


### Name: loess.boot
### Title: 2-D Loess bootstrap.
### Aliases: loess.boot print.loess.simpleboot
### Keywords: loess

### ** Examples

set.seed(1234)

x <- runif(100)

## Simple sine function simulation
y <- sin(2*pi*x) + .2 * rnorm(100)
plot(x, y)  ## Sine function with noise
lo <- loess(y ~ x, span = .4)

## Bootstrap with resampling of rows
lo.b <- loess.boot(lo, R = 500)

## Plot original fit with +/- 2 std. errors
plot(lo.b)

## Plot all loess bootstrap fits
plot(lo.b, all.lines = TRUE)

## Bootstrap with resampling residuals
lo.b2 <- loess.boot(lo, R = 500, rows = FALSE)
plot(lo.b2)




