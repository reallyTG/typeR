library(cnmlcd)


### Name: logvolatility
### Title: Daily Log-volatilities of S&P 500.
### Aliases: logvolatility
### Keywords: datasets

### ** Examples

data(logvolatility)
## Computes and plots the log-concave density estimate
(r = cnmlcd(logvolatility))
plot(r$lcd, logvolatility)               # Density
plot(r$lcd, logvolatility, log=TRUE)     # Log-density
plotgradient(r$lcd, logvolatility)       # Gradient



