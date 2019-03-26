library(stocks)


### Name: sharpe
### Title: Sharpe Ratio
### Aliases: sharpe

### ** Examples

# Simulate daily gains over a 5-year period
set.seed(123)
stock.gains <- rnorm(252 * 5, 0.0005, 0.01)

# Calculate Sharpe ratio using risk-free return of 0
sharpe(stock.gains)





