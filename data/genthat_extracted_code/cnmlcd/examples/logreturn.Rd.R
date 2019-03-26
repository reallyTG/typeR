library(cnmlcd)


### Name: logreturn
### Title: Daily Log-returns of S&P 500.
### Aliases: logreturn
### Keywords: datasets datasets

### ** Examples

data(logreturn)
## Computes and plots the log-concave density estimate
(r = cnmlcd(logreturn))
plot(r$lcd, logreturn)                 # Density
plot(r$lcd, logreturn, log=TRUE)       # Log-density
plotgradient(r$lcd, logreturn)         # Gradient



