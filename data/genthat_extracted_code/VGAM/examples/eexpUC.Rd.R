library(VGAM)


### Name: Expectiles-Exponential
### Title: Expectiles of the Exponential Distribution
### Aliases: Expectiles-Exponential eexp deexp peexp qeexp reexp
### Keywords: distribution

### ** Examples

my.p <- 0.25; y <- rexp(nn <- 1000)
(myexp <- qeexp(my.p))
sum(myexp - y[y <= myexp]) / sum(abs(myexp - y))  # Should be my.p

## Not run: 
##D  par(mfrow = c(2,1))
##D yy <- seq(-0, 4, len = nn)
##D plot(yy, deexp(yy),  col = "blue", ylim = 0:1, xlab = "y", ylab = "g(y)",
##D      type = "l", main = "g(y) for Exp(1); dotted green is f(y) = dexp(y)")
##D lines(yy, dexp(yy), col = "darkgreen", lty = "dotted", lwd = 2)  # 'original'
##D 
##D plot(yy, peexp(yy), type = "l", col = "blue", ylim = 0:1,
##D      xlab = "y", ylab = "G(y)", main = "G(y) for Exp(1)")
##D abline(v = 1, h = 0.5, col = "red", lty = "dashed")
##D lines(yy, pexp(yy), col = "darkgreen", lty = "dotted", lwd = 2) 
## End(Not run)



