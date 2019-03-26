library(nlreg)


### Name: Dvar
### Title: Differentiate the Variance Function of a Nonlinear Model
### Aliases: Dvar
### Keywords: nonlinear

### ** Examples

library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), 
                     start = c(b0 = 4, b1 = 0.1), data = calcium )
Dvar( calcium.nl )
##function (b0, b1, logs)
##{
##    .expr1 <- exp(logs)
##    .value <- .expr1
##    .grad <- array(0, c(length(.value), 1), list(NULL, c("logs")))
##    .hessian <- array(0, c(length(.value), 1, 1), list(NULL,
##        c("logs"), c("logs")))
##    .grad[, "logs"] <- .expr1
##    .hessian[, "logs", "logs"] <- .expr1
##    attr(.value, "gradient") <- .grad
##    attr(.value, "hessian") <- .hessian
##    .value
##}
##
attach( calcium )
calcium.vd <- Dvar( calcium.nl )
param( calcium.nl )
##        b0         b1       logs
## 4.3093653  0.2084780 -1.2856765
##
attr( calcium.vd( 4.31, 0.208, -1.29 ), "gradient" )
##          logs
##[1,] 0.2752708
##
calcium.nl <- update( calcium.nl, weights = ~ ( 1+time^g )^2, 
                      start = c(b0 = 4, b1 = 0.1, g = 1))
Dvar( calcium.nl )
##function (b0, b1, g, logs) 
##{
##    .expr1 <- time^g
##    .expr2 <- 1 + .expr1
##    .expr4 <- exp(logs)
##    .expr5 <- .expr2^2 * .expr4
##    .expr6 <- log(time)
##    .expr7 <- .expr1 * .expr6
##    .expr10 <- 2 * (.expr7 * .expr2) * .expr4
##    .value <- .expr5
##    .grad <- array(0, c(length(.value), 2), list(NULL, c("g",
##        "logs")))
##    .hessian <- array(0, c(length(.value), 2, 2), list(NULL,
##        c("g", "logs"), c("g", "logs")))
##    .grad[, "g"] <- .expr10
##    .hessian[, "g", "g"] <- 2 * (.expr7 * .expr6 * .expr2 + .expr7 *
##        .expr7) * .expr4
##    .hessian[, "g", "logs"] <- .hessian[, "logs", "g"] <- .expr10
##    .grad[, "logs"] <- .expr5
##    .hessian[, "logs", "logs"] <- .expr5
##    attr(.value, "gradient") <- .grad
##    attr(.value, "hessian") <- .hessian
##    .value
##}
##
calcium.vd <- Dvar( calcium.nl )
param( calcium.nl )
##        b0         b1          g       logs 
## 4.3160408  0.2075937  0.3300134 -3.3447585
##
attr( calcium.vd(4.32, 0.208, 0.600, -2.66 ), "gradient" )
##                g      logs
## [1,] -0.11203422 0.1834220
## [2,] -0.11203422 0.1834220
## [3,] -0.11203422 0.1834220
## [4,]  0.09324687 0.3295266
## ...
##
detach()



