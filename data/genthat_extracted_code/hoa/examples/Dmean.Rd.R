library(hoa)


### Name: Dmean
### Title: Differentiate the Mean Function of a Nonlinear Model
### Aliases: Dmean
### Keywords: nonlinear

### ** Examples

library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), 
                     start = c(b0 = 4, b1 = 0.1),  data = calcium )
Dmean( calcium.nl )
##function (b0, b1, logs)
##{
##    .expr3 <- exp(-b1 * time)
##    .expr4 <- 1 - .expr3
##    .expr6 <- .expr3 * time
##    .value <- b0 * .expr4
##    .grad <- array(0, c(length(.value), 2), list(NULL, c("b0",
##        "b1")))
##    .hessian <- array(0, c(length(.value), 2, 2), list(NULL,
##        c("b0", "b1"), c("b0", "b1")))
##    .grad[, "b0"] <- .expr4
##    .hessian[, "b0", "b0"] <- 0
##    .hessian[, "b0", "b1"] <- .hessian[, "b1", "b0"] <- .expr6
##    .grad[, "b1"] <- b0 * .expr6
##    .hessian[, "b1", "b1"] <- -(b0 * (.expr6 * time))
##    attr(.value, "gradient") <- .grad
##    attr(.value, "hessian") <- .hessian
##    .value
##}
##
param( calcium.nl )
##        b0         b1       logs
## 4.3093653  0.2084780 -1.2856765
##
attach( calcium )
calcium.md <- Dmean( calcium.nl )
attr( calcium.md( 4.31, 0.208, -1.29 ), "gradient" )
##              b0       b1
## [1,] 0.08935305 1.766200
## [2,] 0.08935305 1.766200
## [3,] 0.08935305 1.766200
## [4,] 0.23692580 4.275505
## ...
detach()



