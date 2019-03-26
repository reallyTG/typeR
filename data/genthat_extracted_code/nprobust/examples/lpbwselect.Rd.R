library(nprobust)


### Name: lpbwselect
### Title: Bandwidth Selection Procedures for Local Polynomial Regression
###   Estimation and Inference
### Aliases: lpbwselect

### ** Examples

x   <- runif(500)
y   <- sin(4*x) + rnorm(500)
est <- lpbwselect(y,x)
summary(est)



