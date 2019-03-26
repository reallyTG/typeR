library(VGAM)


### Name: Expectiles-sc.t2
### Title: Expectiles/Quantiles of the Scaled Student t Distribution with 2
###   Df
### Aliases: Expectiles-sc.t2 dsc.t2 psc.t2 qsc.t2 rsc.t2
### Keywords: distribution

### ** Examples

my.p <- 0.25; y <- rsc.t2(nn <- 5000)
(myexp <- qsc.t2(my.p))
sum(myexp - y[y <= myexp]) / sum(abs(myexp - y))  # Should be my.p
# Equivalently:
I1 <- mean(y <= myexp) * mean( myexp - y[y <= myexp])
I2 <- mean(y >  myexp) * mean(-myexp + y[y >  myexp])
I1 / (I1 + I2)  # Should be my.p
# Or:
I1 <- sum( myexp - y[y <= myexp])
I2 <- sum(-myexp + y[y >  myexp])

# Non-standard Koenker distribution
myloc <- 1; myscale <- 2
yy <- rsc.t2(nn, myloc, myscale)
(myexp <- qsc.t2(my.p, myloc, myscale))
sum(myexp - yy[yy <= myexp]) / sum(abs(myexp - yy))  # Should be my.p
psc.t2(mean(yy), myloc, myscale)  # Should be 0.5
abs(qsc.t2(0.5, myloc, myscale) - mean(yy))  # Should be 0
abs(psc.t2(myexp, myloc, myscale) - my.p)  # Should be 0
integrate(f = dsc.t2, lower = -Inf, upper = Inf,
          locat = myloc, scale = myscale)  # Should be 1

y <- seq(-7, 7, len = 201)
max(abs(dsc.t2(y) - dt(y / sqrt(2), df = 2) / sqrt(2)))  # Should be 0
## Not run: 
##D  plot(y, dsc.t2(y), type = "l", col = "blue", las = 1,
##D      ylim = c(0, 0.4), main = "Blue = Koenker; orange = N(0, 1)")
##D lines(y, dnorm(y), type = "l", col = "orange")
##D abline(h = 0, v = 0, lty = 2) 
## End(Not run)



