## thwbrosen.R   160624

rm(list=ls())
require(optimr)

cat("Run all optimizers on unconstrained HWB version of Rosenbrock\n")

#  This test file is intended to show the results of all available
#  optimizers (18 as of 2016-6-24) on the extended Rosenbrock function
#  as implemented by Hans Werner Borchers. 
#  The script also illustrates the use of the summary() function for
#  ordering results by value.



fnR <- function (x, gs=100.0) 
{
    n <- length(x)
    x1 <- x[2:n]
    x2 <- x[1:(n - 1)]
    sum(gs * (x1 - x2^2)^2 + (1 - x2)^2)
}
grR <- function (x, gs=100.0) 
{
    n <- length(x)
    g <- rep(NA, n)
    g[1] <- 2 * (x[1] - 1) + 4*gs * x[1] * (x[1]^2 - x[2])
    if (n > 2) {
        ii <- 2:(n - 1)
        g[ii] <- 2 * (x[ii] - 1) + 4 * gs * x[ii] * (x[ii]^2 - x[ii + 
            1]) + 2 * gs * (x[ii] - x[ii - 1]^2)
    }
    g[n] <- 2 * gs * (x[n] - x[n - 1]^2)
    g
}

cat("Standard problem, scale of 100, n = 2 \n")
x0 <- c(-1.2, 1)
## gs = 100.0

a2.100 <- opm(x0, fnR, grR, method="ALL", control=list(trace=1), gs=100.0)
summary(a2.100, order=value)

cat("Standard problem, scale of 10, n = 2 \n")
a2.10 <- opm(x0, fnR, grR, method="ALL", control=list(trace=1), gs=10.0)
summary(a2.10, order=value)

cat("Medium problem, scale of 100, n = 20 \n")
x0<-rep(pi,20)
a20.100 <- opm(x0, fnR, grR, method="ALL", control=list(trace=1), gs=100.0)
summary(a20.100, order=value)

cat("Test the hessian calculation\n")

x0 <- rep(pi,4)

thjn <- optimr(x0, fnR, method="hjn", hessian=TRUE)
print(thjn)
thjn0 <-  optimr(x0, fnR, method="hjn")
print(thjn0)

tlb <- optimr(x0, fnR, grR, method="L-BFGS-B", hessian=TRUE)
print(tlb)
tlb0 <-  optimr(x0, fnR, grR, method="L-BFGS-B")
print(tlb0)

tlbx <- optimr(x0, fnR, method="L-BFGS-B", hessian=TRUE)
print(tlbx)
tlbx0 <-  optimr(x0, fnR, method="L-BFGS-B")
print(tlbx0)

