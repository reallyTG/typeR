library(BBEST)


### Name: test.signal
### Title: A random function with a smooth background
### Aliases: test.signal

### ** Examples

# 1. Create test function 
f <- test.signal(x=seq(0,30,0.01), lambda=5, 
         sigma=0.1, x.delta=1.0, knots.n=5, 
         peaks.widthRange=c(0.1, 0.3), peaks.n=7)
	
# 2. Plot results
plot(f$x, f$y, t="l", xlab="x", ylab="f")
lines(f$x, f$bkg, col=2)
lines(f$x, f$y - f$bkg, col="gray")
legend(20, .9*max(f$y), c("test function", "background", 
       "peaks+noise"), lty=1, col=c(1,2,"gray"))




