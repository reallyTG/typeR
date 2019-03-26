library(sfsmisc)


### Name: D1D2
### Title: Numerical Derivatives of (x,y) Data via Smoothing Splines
### Aliases: D1D2
### Keywords: smooth

### ** Examples

 set.seed(8840)
 x <- runif(100, 0,10)
 y <- sin(x) + rnorm(100)/4

 op <- par(mfrow = c(2,1))
 plot(x,y)
 lines(ss <- smooth.spline(x,y), col = 4)
 str(ss[c("df", "spar")])
 if(is.R()) plot(cos, 0, 10, ylim = c(-1.5,1.5), lwd=2) else { # Splus
   xx <- seq(0,10, len=201); plot(xx, cos(xx), type = 'l', ylim = c(-1.5,1.5))
 }
 title(expression("Estimating f'() :  " * frac(d,dx) * sin(x) == cos(x)))
 offs <- c(-0.1, 0, 0.1, 0.2, 0.3)
 i <- 1
 for(off in offs) {
   d12 <- D1D2(x,y, spar.offset = off)
   lines(d12$x, d12$D1, col = i <- i+1)
 }
 legend(2,1.6, c("true cos()",paste("sp.off. = ", format(offs))), lwd=1,
        col = 1:(1+length(offs)), cex = 0.8, bg = NA)
 par(op)



