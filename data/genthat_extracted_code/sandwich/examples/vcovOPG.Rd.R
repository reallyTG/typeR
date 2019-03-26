library(sandwich)


### Name: vcovOPG
### Title: Outer-Product-of-Gradients Covariance Matrix Estimation
### Aliases: vcovOPG
### Keywords: regression ts

### ** Examples

## generate poisson regression relationship
x <- sin(1:100)
y <- rpois(100, exp(1 + x))
## compute usual covariance matrix of coefficient estimates
fm <- glm(y ~ x, family = poisson)
vcov(fm)
vcovOPG(fm)



