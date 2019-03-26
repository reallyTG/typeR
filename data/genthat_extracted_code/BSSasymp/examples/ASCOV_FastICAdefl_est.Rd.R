library(BSSasymp)


### Name: ASCOV_FastICAdefl_est
### Title: Asymptotic covariance matrices of deflation-based FastICA
###   estimates
### Aliases: ASCOV_FastICAdefl_est
### Keywords: multivariate

### ** Examples

# source components have uniform- and exponential(1)- distribution  
s1 <- runif(1000,-sqrt(3),sqrt(3))
s2 <- rexp(1000)
S <- cbind(s1,s2)

# couple of nonlinearities
g_pow3 <- function(x){x^3}
dg_pow3 <- function(x){3*x^2}
G_pow3 <- function(x){x^4/4}

g_gaus <- function(x){x*exp(-x^2/2)}
dg_gaus <- function(x){exp(-x^2/2)-x^2*exp(-x^2/2)}

gs <- c(g_pow3,g_gaus)
dgs <- c(dg_pow3,dg_gaus)

A<-matrix(rnorm(4),2,2)

X <- S %*% t(A)

round(1000*ASCOV_FastICAdefl_est(X, gs=gs, dgs=dgs)$COV_W,2)

round(1000*ASCOV_FastICAdefl_est(X, gs=c(g_pow3), dgs=c(dg_pow3),
Gs=c(G_pow3), method="G")$COV_W,2)




