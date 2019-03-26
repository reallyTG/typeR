library(mcll)


### Name: mcll_est
### Title: Parameter estimation using MCLL
### Aliases: mcll_est
### Keywords: mcll locfit est

### ** Examples

## example

# posterior samples
data(samp)

# prior function
prior.func <- function(vec.t) {
    sum(dnorm(vec.t, m= c(0,0,0,0, -0.9870405, -0.9870405) ,
                sd=c(100,100,100,100, 1/0.766672, 1/0.766672) , log=TRUE))
}

## parameter estimation
run1 <- system.time(
    result1 <- mcll_est(data=samp, prior.func= prior.func, alp=0.7,
        method = "BFGS", control= list(maxit=10000))
)

# result1$par
#            b0        b1         b2       b3       tau0     tau1
#[1,] 0.9275766 -2.871686 -0.6488625 3.589313 0.08118962 0.148478




