library(lmtest)


### Name: gqtest
### Title: Goldfeld-Quandt Test
### Aliases: gqtest
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
## perform Goldfeld-Quandt test
gqtest(y1 ~ x)
gqtest(y2 ~ x)



