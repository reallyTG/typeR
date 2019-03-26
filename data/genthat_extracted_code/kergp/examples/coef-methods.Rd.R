library(kergp)


### Name: coef-methods
### Title: Extract Coefficients of a Covariance Kernel Object as Vector,
###   List or Matrix
### Aliases: coef,methods coef,covMan-method coef,covTS-method

### ** Examples

d <- 3
myCov1 <- covTS(d = d, kernel = "k1Exp", dep = c(range = "input"),
                value = c(range = 1.1))
myCov1
## versatile 'coef' method
coef(myCov1)
coef(myCov1, as = "matrix")
coef(myCov1, as = "list")
coef(myCov1, as = "matrix", type = "range")
coef(myCov1) <- c(0.2, 0.3, 0.4, 4, 16, 25)
coef(myCov1, as = "matrix")



