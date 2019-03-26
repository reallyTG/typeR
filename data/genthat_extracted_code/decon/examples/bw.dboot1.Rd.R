library(decon)


### Name: bw.dboot1
### Title: A bootstrap bandwidth selection without resampling
### Aliases: bw.dboot1
### Keywords: smooth

### ** Examples


n <- 1000
x <- c(rnorm(n/2,-2,1),rnorm(n/2,2,1))
## the case of homoscedastic normal error
sig <- .8
u <- rnorm(n, sd=sig)
w <- x+u
bw.dboot1(w,sig=sig)
## the case of homoscedastic laplacian error
sig <- .8
## generate laplacian errors
u <- ifelse(runif(n) > 0.5, 1, -1) * rexp(n,rate=1/sig)
w <- x+u
bw.dboot1(w,sig=sig,error='laplacian')
## the case of heteroscedastic normal error
sig <- runif(n, .7, .9)
u <- sapply(sig, function(x) rnorm(1, sd=x))
w <- x+u
bw.dboot1(w,sig=sig,error='normal')





