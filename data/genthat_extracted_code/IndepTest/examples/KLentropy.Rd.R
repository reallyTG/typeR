library(IndepTest)


### Name: KLentropy
### Title: KLentropy
### Aliases: KLentropy

### ** Examples

n=1000; x=rnorm(n); KLentropy(x,30,stderror=TRUE)   # The true value is 0.5*log(2*pi*exp(1)) = 1.42.
n=5000; x=matrix(rnorm(4*n),ncol=4)                 # The true value is 2*log(2*pi*exp(1)) = 5.68
KLentropy(x,30,weights=FALSE)                       # Unweighted estimator
KLentropy(x,30,weights=TRUE)                        # Weights chosen by L2OptW
w=runif(30); w=w/sum(w); KLentropy(x,30,weights=w)  # User-specified weights




