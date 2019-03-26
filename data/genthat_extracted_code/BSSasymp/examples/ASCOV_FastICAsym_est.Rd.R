library(BSSasymp)


### Name: ASCOV_FastICAsym_est
### Title: Asymptotic covariance matrix of symmetric FastICA estimate
### Aliases: ASCOV_FastICAsym_est ASCOV_FastICAsym2_est
### Keywords: multivariate

### ** Examples

# source components have uniform- and exponential(1)- distribution  
n <- 1000
s1 <- runif(n,-sqrt(3),sqrt(3))
s2 <- rexp(n)
S <- cbind(s1,s2)

# couple of nonlinearities
g_pow3 <- function(x){x^3}
dg_pow3 <- function(x){3*x^2}
G_pow3 <- function(x){x^4/4}

g_gaus <- function(x){x*exp(-x^2/2)}
dg_gaus <- function(x){exp(-x^2/2)-x^2*exp(-x^2/2)}
G_gaus <- function(x){-exp(-x^2/2)}

A<-matrix(rnorm(4),2,2)

X <- S %*% t(A)

round(n*ASCOV_FastICAsym_est(X,G=G_pow3,g=g_pow3,dg=dg_pow3)$COV_W,2)
round(n*ASCOV_FastICAsym_est(X,G=G_gaus,g=g_gaus,dg=dg_gaus)$COV_W,2)




