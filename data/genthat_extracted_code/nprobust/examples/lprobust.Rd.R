library(nprobust)


### Name: lprobust
### Title: Local Polynomial Methods with Robust Bias-Corrected Inference
### Aliases: lprobust
### Keywords: LPR Robust Estimation

### ** Examples

x   <- runif(500)
y   <- sin(4*x) + rnorm(500)
est <- lprobust(y,x)
summary(est)



