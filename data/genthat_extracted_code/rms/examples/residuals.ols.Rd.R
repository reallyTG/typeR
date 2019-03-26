library(rms)


### Name: residuals.ols
### Title: Residuals for ols
### Aliases: residuals.ols
### Keywords: models regression

### ** Examples

set.seed(1)
x1 <- rnorm(100)
x2 <- rnorm(100)
x1[1] <- 100
y <- x1 + x2 + rnorm(100)
f <- ols(y ~ x1 + x2, x=TRUE, y=TRUE)
resid(f, "dfbetas")
which.influence(f)



