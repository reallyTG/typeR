library(Dowd)


### Name: BlancoIhleBacktest
### Title: Blanco-Ihle forecast evaluation backtest measure
### Aliases: BlancoIhleBacktest

### ** Examples

# Blanco-Ihle Backtest For Independence for given confidence level.
   # The VaR and ES are randomly generated.
   a <- rnorm(1*100)
   b <- abs(rnorm(1*100))+2
   c <- abs(rnorm(1*100))+2
   BlancoIhleBacktest(a, b, c, 0.95)



