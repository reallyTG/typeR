library(rms)


### Name: vif
### Title: Variance Inflation Factors
### Aliases: vif
### Keywords: models regression

### ** Examples

set.seed(1)
x1 <- rnorm(100)
x2 <- x1+.1*rnorm(100)
y  <- sample(0:1, 100, TRUE)
f  <- lrm(y ~ x1 + x2)
vif(f)



