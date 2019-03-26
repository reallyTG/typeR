library(cnmlcd)


### Name: cnmlcd
### Title: Maximum Likelihood Estimation of a Log-concave Density Function
### Aliases: cnmlcd

### ** Examples

## Normal density
x = rnorm(1000)
(r = cnmlcd(x))

## Log-likelihood values at the NPMLE
r$ll
logLik(r$lcd, x)

## Density or log density plot
plot(r$lcd)
plot(r$lcd, x)
plot(r$lcd, x, log = TRUE)

## Density function of the Log-concave distribution
dlcd(-4:4, r$lcd)

## Estimation from log-return data
data(logreturn)
r = cnmlcd(logreturn)
plot(r$lcd, logreturn)
plot(r$lcd, logreturn, log = TRUE)

## Estimation for log-volatility data
data(logvolatility)
r = cnmlcd(logvolatility)
plot(r$lcd, logvolatility)



