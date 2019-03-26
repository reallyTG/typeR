library(nloptr)


### Name: direct
### Title: DIviding RECTangles Algorithm for Global Optimization
### Aliases: direct directL directL

### ** Examples


### Minimize the Hartmann6 function
hartmann6 <- function(x) {
    n <- length(x)
    a <- c(1.0, 1.2, 3.0, 3.2)
    A <- matrix(c(10.0,  0.05, 3.0, 17.0,
                   3.0, 10.0,  3.5,  8.0,
                  17.0, 17.0,  1.7,  0.05,
                   3.5,  0.1, 10.0, 10.0,
                   1.7,  8.0, 17.0,  0.1,
                   8.0, 14.0,  8.0, 14.0), nrow=4, ncol=6)
    B  <- matrix(c(.1312,.2329,.2348,.4047,
                   .1696,.4135,.1451,.8828,
                   .5569,.8307,.3522,.8732,
                   .0124,.3736,.2883,.5743,
                   .8283,.1004,.3047,.1091,
                   .5886,.9991,.6650,.0381), nrow=4, ncol=6)
    fun <- 0.0
    for (i in 1:4) {
        fun <- fun - a[i] * exp(-sum(A[i,]*(x-B[i,])^2))
    }
    return(fun)
}
S <- directL(hartmann6, rep(0,6), rep(1,6),
             nl.info = TRUE, control=list(xtol_rel=1e-8, maxeval=1000))
## Number of Iterations....: 500
## Termination conditions:  stopval: -Inf
##     xtol_rel: 1e-08,  maxeval: 500,  ftol_rel: 0,  ftol_abs: 0
## Number of inequality constraints:  0
## Number of equality constraints:    0
## Current value of objective function:  -3.32236800687327
## Current value of controls:
##     0.2016884 0.1500025 0.4768667 0.2753391 0.311648 0.6572931




