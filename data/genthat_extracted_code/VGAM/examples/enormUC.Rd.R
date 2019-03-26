library(VGAM)


### Name: Expectiles-Normal
### Title: Expectiles of the Normal Distribution
### Aliases: Expectiles-Normal enorm denorm penorm qenorm renorm
### Keywords: distribution

### ** Examples

my.p <- 0.25; y <- rnorm(nn <- 1000)
(myexp <- qenorm(my.p))
sum(myexp - y[y <= myexp]) / sum(abs(myexp - y))  # Should be my.p

# Non-standard normal
mymean <- 1; mysd <- 2
yy <- rnorm(nn, mymean, mysd)
(myexp <- qenorm(my.p, mymean, mysd))
sum(myexp - yy[yy <= myexp]) / sum(abs(myexp - yy))  # Should be my.p
penorm(-Inf, mymean, mysd)      #  Should be 0
penorm( Inf, mymean, mysd)      #  Should be 1
penorm(mean(yy), mymean, mysd)  #  Should be 0.5
abs(qenorm(0.5, mymean, mysd) - mean(yy))  #  Should be 0
abs(penorm(myexp, mymean, mysd) - my.p)    #  Should be 0
integrate(f = denorm, lower = -Inf, upper = Inf,
          mymean, mysd)  #  Should be 1

## Not run: 
##D par(mfrow = c(2, 1))
##D yy <- seq(-3, 3, len = nn)
##D plot(yy, denorm(yy), type = "l", col="blue", xlab = "y", ylab = "g(y)",
##D      main = "g(y) for N(0,1); dotted green is f(y) = dnorm(y)")
##D lines(yy, dnorm(yy), col = "darkgreen", lty = "dotted", lwd = 2)  # 'original'
##D 
##D plot(yy, penorm(yy), type = "l", col = "blue", ylim = 0:1,
##D      xlab = "y", ylab = "G(y)", main = "G(y) for N(0,1)")
##D abline(v = 0, h = 0.5, col = "red", lty = "dashed")
##D lines(yy, pnorm(yy), col = "darkgreen", lty = "dotted", lwd = 2) 
## End(Not run)



