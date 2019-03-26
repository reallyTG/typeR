library(sandwich)


### Name: weightsLumley
### Title: Weighted Empirical Adaptive Variance Estimation
### Aliases: weightsLumley weave
### Keywords: regression ts

### ** Examples

x <- sin(1:100)
y <- 1 + x + rnorm(100)
fm <- lm(y ~ x)
weave(fm)
vcov(fm)



