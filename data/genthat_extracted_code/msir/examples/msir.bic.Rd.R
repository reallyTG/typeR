library(msir)


### Name: msir.bic
### Title: BIC-type criterion for dimensionality
### Aliases: msir.bic bicDimRed
### Keywords: regression

### ** Examples

# 1-dimensional symmetric response curve
n <- 200
p <- 5
b <- as.matrix(c(1,-1,rep(0,p-2)))
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- (0.5 * x%*%b)^2 + 0.1*rnorm(n)
MSIR <- msir(x, y)
msir.bic(MSIR, plot = TRUE)
summary(MSIR)
msir.bic(MSIR, type = 3, plot = TRUE)
summary(MSIR)



