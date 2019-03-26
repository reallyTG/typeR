library(BSSasymp)


### Name: ASCOV_FastICAsym
### Title: Asymptotic covariance matrix of symmetric FastICA estimates
### Aliases: ASCOV_FastICAsym ASCOV_FastICAsym2
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
G_gaus <- function(x){-exp(-x^2/2)}

A <- matrix(rnorm(4),2,2)

res1 <- ASCOV_FastICAsym(sdf=c(fu,fe), G=G_pow3, g=g_pow3, dg=dg_pow3, 
supp=supp, A=A)
res2 <- ASCOV_FastICAsym(sdf=c(fu,fe), G=G_gaus, g=g_gaus, dg=dg_gaus, 
supp=supp, A=A)

round(res1$COV_W, 2)
res1$EMD

round(res2$COV_W, 2)
res2$EMD



