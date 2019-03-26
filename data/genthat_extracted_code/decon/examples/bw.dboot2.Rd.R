library(decon)


### Name: bw.dboot2
### Title: A bootstrap bandwidth selection with resampling
### Aliases: bw.dboot2
### Keywords: smooth

### ** Examples


n <- 1000
x <- c(rnorm(n/2,-2,1),rnorm(n/2,2,1))
## the case of homoscedastic normal error
sig <- .8
u <- rnorm(n, sd=sig)
w <- x+u
bw.dboot2(w,sig=sig)
## the case of homoscedastic laplacian error
sig <- .8
## generate laplacian error
u <- ifelse(runif(n) > 0.5, 1, -1) * rexp(n,rate=1/sig)
w <- x+u
bw.dboot2(w,sig=sig,error='laplacian')




