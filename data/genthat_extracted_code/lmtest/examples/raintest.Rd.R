library(lmtest)


### Name: raintest
### Title: Rainbow Test
### Aliases: raintest
### Keywords: htest

### ** Examples

x <- c(1:30)
y <- x^2 + rnorm(30,0,2)
rain <- raintest(y ~ x)
rain
## critical value
qf(0.95, rain$parameter[1], rain$parameter[2])



