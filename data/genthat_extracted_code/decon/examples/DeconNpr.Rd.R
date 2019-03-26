library(decon)


### Name: DeconNpr
### Title: Perform nonparametric regression with errors-in-variables
### Aliases: DeconNpr
### Keywords: nonparametric smooth regression errors-in-variables

### ** Examples


n <- 2000
x <- c(rnorm(n/2,2,1), rnorm(n/2, -2,1))
sig <- .8
u <- sig*rnorm(n)
w <- x+u
e <- rnorm(n, sd=0.2)
y <- x^2-2*x+e
bw1 <- bw.dboot1(w, sig)
# estimate the unknown density with measurement error
(m1 <-  DeconNpr(w, sig, y ,error="normal", from=0.9*min(x), to=0.9*max(x)))
# plot the results
plot(m1, col="red", lwd=3, lty=2, xlab="x", ylab="m(x)", main="", 
			zero.line=FALSE)
lines(ksmooth(x,y, kernel = "normal", 2, range.x=c(0.9*min(x),0.9*max(x))), 
			lwd=3, lty=1)
lines(ksmooth(w,y, kernel = "normal", 2, range.x=c(0.9*min(x),0.9*max(x))), 
			col="blue", lwd=3, lty=3)




