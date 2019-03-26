library(stocks)


### Name: sortino
### Title: Sortino Ratio
### Aliases: sortino

### ** Examples

# Simulate daily gains over a 5-year period
set.seed(123)
stock.gains <- rnorm(252 * 5, 0.0005, 0.01)

# Calculate Sortino ratio using risk-free return of 0
sortino(stock.gains)





