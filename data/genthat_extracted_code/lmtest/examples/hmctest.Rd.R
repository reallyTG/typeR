library(lmtest)


### Name: hmctest
### Title: Harrison-McCabe test
### Aliases: hmctest
### Keywords: htest

### ** Examples

## generate a regressor
x <- rep(c(-1,1), 50)
## generate heteroskedastic and homoskedastic disturbances
err1 <- c(rnorm(50, sd=1), rnorm(50, sd=2))
err2 <- rnorm(100)
## generate a linear relationship
y1 <- 1 + x + err1
y2 <- 1 + x + err2
## perform Harrison-McCabe test
hmctest(y1 ~ x)
hmctest(y2 ~ x)



