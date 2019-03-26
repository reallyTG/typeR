library(BSSasymp)


### Name: ASCOV_FastICAdefl
### Title: Asymptotic covariance matrices of different deflation-based
###   FastICA estimates
### Aliases: ASCOV_FastICAdefl
### Keywords: multivariate

### ** Examples

# source components have uniform- and exponential(1)- distribution  
fu <- function(x){1/(sqrt(3)*2)}
fe <- function(x){exp(-x-1)}

supp <- matrix(c(-sqrt(3),sqrt(3),-1,Inf), nrow=2, ncol=2, byrow=TRUE)

# couple of nonlinearities
g_pow3 <- function(x){x^3}
dg_pow3 <- function(x){3*x^2}
G_pow3 <- function(x){x^4/4}

g_gaus <- function(x){x*exp(-x^2/2)}
dg_gaus <- function(x){exp(-x^2/2)-x^2*exp(-x^2/2)}

gs <- c(g_pow3,g_gaus)
dgs <- c(dg_pow3,dg_gaus)

A <- matrix(rnorm(4),2,2)

res1 <- ASCOV_FastICAdefl(sdf=c(fu,fe), gs=gs, dgs=dgs, supp=supp, A=A)

round(res1$COV_W, 2)
res1$EMD
res1$used_gs

res2 <- ASCOV_FastICAdefl(sdf=c(fu,fe), gs=c(g_pow3), dgs=c(dg_pow3), 
Gs=c(G_pow3), method="G", supp=supp, A=A)

res2$EMD



