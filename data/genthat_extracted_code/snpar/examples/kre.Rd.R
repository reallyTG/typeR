library(snpar)


### Name: kre
### Title: Kernel Regression Estimation
### Aliases: kre
### Keywords: kre

### ** Examples

x <- rnorm(100)
y <- 1 + 4*x^2 + rnorm(100)
kr <- kre(x,y, kernel = "epan", plot = TRUE)




