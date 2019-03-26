library(decon)


### Name: DeconCPdf
### Title: Estimating conditional probability density function from data
###   with measurement error
### Aliases: DeconCPdf
### Keywords: nonparametric smooth measurement error

### ** Examples


n <- 1000
x <- c(rnorm(n/2,-2,1),rnorm(n/2,2,1))
sig <- .8
u <- rnorm(n,sd=sig)
w <- x+u

f1 <-  DeconCPdf(w,sig, y0=-2.5, error='normal')
f2 <-  DeconCPdf(w,sig, y0=0, error='normal')
f3 <-  DeconCPdf(w,sig, y0=2.5, error='normal')

par(mfrow=c(2,2))
plot(density(w), main="f_w", xlab="w")
plot(f1, main="f1", xlab="x")
plot(f2, main="f2", xlab="x")
plot(f3, main="f3", xlab="x")




