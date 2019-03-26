library(decon)


### Name: DeconPdf
### Title: Estimating probability density function from data with
###   measurement error
### Aliases: DeconPdf
### Keywords: nonparametric smooth density estimation measurement error

### ** Examples


## Deconvolution: the case of homoscedastic errors
## Case 1.1: homoscedastic Laplacian errors
n1 <- 500
x1 <- rnorm(n1, sd=1)
sig1 <- .5
u1 <- ifelse(runif(n1) > 0.5, 1, -1) * rexp(n1,rate=1/sig1)
w1 <- x1+u1
## The rule-of-thumb method may not be accurate, 
## you may try the bootstrap method
bw1 <- bw.dnrd(w1,sig=sig1, error="laplacian")
(f1 <-  DeconPdf(w1,sig1,error='laplacian',bw=bw1, fft=TRUE))

## Case 1.2: homoscedastic normal errors
n2 <- 1000
x2 <- c(rnorm(n2/2,-3,1),rnorm(n2/2,3,1))
sig2 <- .8
u2 <- rnorm(n2, sd=sig2)
w2 <- x2+u2
# estimate the bandwidth with the bootstrap method with resampling
bw2 <- bw.dboot2(w2,sig=sig2, error="normal")
# estimate the unknown density with measurement error
(f2 <-  DeconPdf(w2,sig2,error='normal',bw=bw2, fft=TRUE))

# plot the results
par(mfrow=c(1,2))
plot(f1,  col="red", lwd=3, lty=2, xlab="x", ylab="f(x)", main="")
lines(density(x1, from=min(w1), to=max(w1)), lwd=3, lty=1)
lines(density(w1), col="blue", lwd=3, lty=3)
plot(f2,  col="red", lwd=3, lty=2, xlab="x", ylab="f(x)", main="")
lines(density(x2, from=min(w2), to=max(w2)), lwd=3, lty=1)
lines(density(w2), col="blue", lwd=3, lty=3)


## Deconvolution: the case of heteroscedastic errors
## Case 2: heteroscedastic normal errors
n3 <- 2000
x3 <- rchisq(n3, df=1.5, ncp=0)
sig3 <- 0.7+ x3/max(x3)
u3 <- sapply(sig3, function(x) rnorm(1, sd=x))
w3 <- x3+u3
# estimate the bandwidth using the bootstrap method withou resampling
bw3 <- bw.dboot1(w3,sig=sig3, error="normal")
# estimate the unknown density with measurement error
(f3 <-  DeconPdf(w3,sig3,error="normal", bw=bw3, fft=TRUE))

# plot the results
par(mfrow=c(1,1))
plot(f3,  col="red", lwd=3, lty=2, ylim=c(0,0.4), xlab="x", ylab="f(x)", main="")
lines(density(x3, adjust=2), lwd=3, lty=1)
lines(density(w3, adjust=2), col="blue", lwd=3, lty=3)





