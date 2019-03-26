library(lmtest)


### Name: resettest
### Title: RESET Test
### Aliases: resettest reset
### Keywords: htest

### ** Examples

x <- c(1:30)
y1 <- 1 + x + x^2 + rnorm(30)
y2 <- 1 + x + rnorm(30)
resettest(y1 ~ x, power=2, type="regressor")
resettest(y2 ~ x, power=2, type="regressor")



