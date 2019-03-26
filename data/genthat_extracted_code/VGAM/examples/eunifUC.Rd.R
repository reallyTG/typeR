library(VGAM)


### Name: Expectiles-Uniform
### Title: Expectiles of the Uniform Distribution
### Aliases: Expectiles-Uniform eunif deunif peunif qeunif reunif
### Keywords: distribution

### ** Examples

my.p <- 0.25; y <- runif(nn <- 1000)
(myexp <- qeunif(my.p))
sum(myexp - y[y <= myexp]) / sum(abs(myexp - y))  # Should be my.p
# Equivalently:
I1 <- mean(y <= myexp) * mean( myexp - y[y <= myexp])
I2 <- mean(y >  myexp) * mean(-myexp + y[y >  myexp])
I1 / (I1 + I2)  # Should be my.p
# Or:
I1 <- sum( myexp - y[y <= myexp])
I2 <- sum(-myexp + y[y >  myexp])

# Non-standard uniform
mymin <- 1; mymax <- 8
yy <- runif(nn, mymin, mymax)
(myexp <- qeunif(my.p, mymin, mymax))
sum(myexp - yy[yy <= myexp]) / sum(abs(myexp - yy))  # Should be my.p
peunif(mymin, mymin, mymax)     #  Should be 0
peunif(mymax, mymin, mymax)     #  Should be 1
peunif(mean(yy), mymin, mymax)  #  Should be 0.5
abs(qeunif(0.5, mymin, mymax) - mean(yy))  #  Should be 0
abs(qeunif(0.5, mymin, mymax) - (mymin+mymax)/2)  #  Should be 0
abs(peunif(myexp, mymin, mymax) - my.p)  #  Should be 0
integrate(f = deunif, lower = mymin - 3, upper = mymax + 3,
          min = mymin, max = mymax)  # Should be 1

## Not run: 
##D par(mfrow = c(2,1))
##D yy <- seq(0.0, 1.0, len = nn)
##D plot(yy, deunif(yy), type = "l", col = "blue", ylim = c(0, 2),
##D      xlab = "y", ylab = "g(y)", main = "g(y) for Uniform(0,1)")
##D lines(yy, dunif(yy), col = "darkgreen", lty = "dotted", lwd = 2)  # 'original'
##D 
##D plot(yy, peunif(yy), type = "l", col = "blue", ylim = 0:1,
##D      xlab = "y", ylab = "G(y)", main = "G(y) for Uniform(0,1)")
##D abline(a = 0.0, b = 1.0, col = "darkgreen", lty = "dotted", lwd = 2)
##D abline(v = 0.5, h = 0.5, col = "red", lty = "dashed") 
## End(Not run)



