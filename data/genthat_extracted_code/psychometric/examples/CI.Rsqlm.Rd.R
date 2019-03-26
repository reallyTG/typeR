library(psychometric)


### Name: CI.Rsqlm
### Title: Confidence Interval for Rsq - from lm()
### Aliases: CI.Rsqlm
### Keywords: htest models

### ** Examples

# Generate data 
x <- rnorm(100)
z <- rnorm(100)
xz <- x*z
y <- .25*x - .25*z + .25*x*z + .25*rnorm(100)
# Create an lm() object
lm1 <- lm(y ~ x*z)
CI.Rsqlm(lm1)




