library(BSSasymp)


### Name: alphas
### Title: Asymptotic variances of the deflation-based FastICA estimate
### Aliases: alphas
### Keywords: multivariate

### ** Examples

# source components have uniform- and exponential(1)- distribution  
fu <- function(x){1/(sqrt(3)*2)}
fe <- function(x){exp(-x-1)}

supp <- matrix(c(-sqrt(3),sqrt(3),-1,Inf), nrow=2, ncol=2, byrow=TRUE)

# couple of nonlinearities
g_pow3 <- function(x){x^3}
dg_pow3 <- function(x){3*x^2}

g_gaus <- function(x){x*exp(-x^2/2)}
dg_gaus <- function(x){exp(-x^2/2)-x^2*exp(-x^2/2)}

gs <- c(g_pow3,g_gaus)
dgs <- c(dg_pow3,dg_gaus)

alphas(sdf=c(fu,fe), gs=c(g_pow3), dgs=c(dg_pow3), supp=supp)

alphas(sdf=c(fu,fe), gs=gs, dgs=dgs, supp=supp)




