library(BSSasymp)


### Name: ASCOV_JADE
### Title: Asymptotic covariance matrix of JADE and FOBI estimates
### Aliases: ASCOV_JADE ASCOV_FOBI
### Keywords: multivariate

### ** Examples

# source components have uniform- and exponential(1)- distribution  
fu <- function(x){1/(sqrt(3)*2)}
fe <- function(x){exp(-x-1)}

supp <- matrix(c(-sqrt(3),sqrt(3),-1,Inf), nrow=2, ncol=2, byrow=TRUE)
A<-matrix(rnorm(4),2,2)

jade <- ASCOV_JADE(sdf=c(fu,fe), supp=supp, A=A)
fobi <- ASCOV_FOBI(sdf=c(fu,fe), supp=supp, A=A)

round(jade$COV_W,2)
round(fobi$COV_W,2)

jade$EMD
fobi$EMD



