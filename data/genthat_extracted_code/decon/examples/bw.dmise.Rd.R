library(decon)


### Name: bw.dmise
### Title: The MISE based plug-in bandwidth selection
### Aliases: bw.dmise
### Keywords: smooth

### ** Examples


n <- 1000
x <- c(rnorm(n/2,-2,1),rnorm(n/2,2,1))
## the case of homoscedastic normal error
sig <- .8
u <- rnorm(n, sd=sig)
w <- x+u
bw.dmise(w,sig=sig,error='normal');
## The small error case
sig <- .25
u <- rnorm(n, sd=sig)
w <- x+u
bw.dmise(w,sig=sig,kernel='normal',error='normal');

## the case of homoscedastic laplacian error
sig <- .8
## generate laplacian error
u <- ifelse(runif(n) > 0.5, 1, -1) * rexp(n,rate=1/sig)
w <- x+u
bw.dmise(w,sig=sig,error='laplace')

## the case of heteroscedastic normal error
sig <- runif(n, .7, .9)
u <- sapply(sig, function(x) rnorm(1, sd=x))
w <- x+u
bw.dmise(w,sig=sig,kernel='support',error='normal')




