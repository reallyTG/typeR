library(lpdensity)


### Name: lpdensity
### Title: Local Polynomial Density Estimation and Inference
### Aliases: lpdensity

### ** Examples

set.seed(42); X <- rnorm(2000)
est1 <- lpdensity(data = X, bwselect = "imse-dpi")
summary(est1)




