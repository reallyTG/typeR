library(RND)


### Name: fit.implied.volatility.curve
### Title: Fit Implied Quadratic Volatility Curve
### Aliases: fit.implied.volatility.curve

### ** Examples


#
# Suppose we see the following implied volatilities and strikes:
#

implied.sigma = c(0.11, 0.08, 0.065, 0.06, 0.05)  
strikes       = c(340, 360, 380, 400, 410)
tmp           = fit.implied.volatility.curve(x = implied.sigma, k = strikes)
tmp

strike.range = 340:410
plot(implied.sigma ~ strikes)
lines(strike.range, tmp$a0 + tmp$a1 * strike.range + tmp$a2 * strike.range^2)




