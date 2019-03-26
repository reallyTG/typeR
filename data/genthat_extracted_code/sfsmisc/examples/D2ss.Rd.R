library(sfsmisc)


### Name: D2ss
### Title: Numerical Derivatives of (x,y) Data (via Smoothing Splines)
### Aliases: D2ss D1ss D1tr
### Keywords: smooth

### ** Examples


## First Derivative  --- spar.off = 0  ok "asymptotically" (?)
set.seed(330)
mult.fig(12)
for(i in 1:12) {
  x <- runif(500, 0,10); y <- sin(x) + rnorm(500)/4
  f1 <- D1ss(x=x,y=y, spar.off=0.0)
  plot(x,f1, ylim = range(c(-1,1,f1)))
  curve(cos(x), col=3, add= TRUE)
}

 set.seed(8840)
 x <- runif(100, 0,10)
 y <- sin(x) + rnorm(100)/4

 op <- par(mfrow = c(2,1))
 plot(x,y)
 lines(ss <- smooth.spline(x,y), col = 4)
 str(ss[c("df", "spar")])
 xx <- seq(0,10, len=201)
 plot(xx, -sin(xx), type = 'l', ylim = c(-1.5,1.5))
 title(expression("Estimating f''() :  " * frac(d^2,dx^2) * sin(x) == -sin(x)))
 offs <- c(0.05, 0.1, 0.1348, 0.2)
 i <- 1
 for(off in offs) {
   d12 <- D2ss(x,y, spar.offset = off)
   lines(d12, col = i <- i+1)
 }
 legend(2,1.6, c("true :  -sin(x)",paste("sp.off. = ", format(offs))), lwd=1,
        col = 1:(1+length(offs)), cex = 0.8, bg = NA)
 par(op)



