library(fANCOVA)


### Name: loess.as
### Title: Fit a local polynomial regression with automatic smoothing
###   parameter selection
### Aliases: loess.as
### Keywords: nonparametric smooth

### ** Examples

## Fit Local Polynomial Regression with Automatic Smoothing Parameter Selection
n1 <- 100
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x1) + e1

(y1.fit <- loess.as(x1, y1, plot=TRUE))

n2 <- 100
x21 <- runif(n2, min=0, max=3)
x22 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x21) + sin(2*x22) + 1 + e2

(y2.fit <- loess.as(cbind(x21, x22), y2, plot=TRUE))




