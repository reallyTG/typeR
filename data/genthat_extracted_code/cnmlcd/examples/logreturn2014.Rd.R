library(cnmlcd)


### Name: logreturn2014
### Title: Daily Log-returns of S&P 500 in 2014.
### Aliases: logreturn2014
### Keywords: datasets

### ** Examples

data(logreturn2014)
## Computes and plots the log-concave density estimate
(r = cnmlcd(logreturn2014))
plot(r$lcd, logreturn2014)               # Density
plot(r$lcd, logreturn2014, log=TRUE)     # Log-density
plotgradient(r$lcd, logreturn2014)       # Gradient



