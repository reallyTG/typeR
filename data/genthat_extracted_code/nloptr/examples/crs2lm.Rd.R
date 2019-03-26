library(nloptr)


### Name: crs2lm
### Title: Controlled Random Search
### Aliases: crs2lm

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

S <- mlsl(x0 = rep(0, 6), hartmann6, lower = rep(0,6), upper = rep(1,6),
            nl.info = TRUE, control=list(xtol_rel=1e-8, maxeval=1000))
## Number of Iterations....: 4050
## Termination conditions:  maxeval: 10000	xtol_rel: 1e-06
## Number of inequality constraints:  0
## Number of equality constraints:    0
## Optimal value of objective function:  -3.32236801141328
## Optimal value of controls:
##     0.2016893 0.1500105 0.4768738 0.2753326 0.3116516 0.6573004




