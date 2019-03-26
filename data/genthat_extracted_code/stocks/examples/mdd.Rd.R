library(stocks)


### Name: mdd
### Title: Maximum Drawdown
### Aliases: mdd

### ** Examples

## Not run: 
##D # Simulate minute-to-minute stock gains over a 2-year period
##D set.seed(123)
##D stock.gains <- rnorm(6.5 * 60 * 252 * 2, 0.000005, 0.001)
##D 
##D # Convert to stock prices assuming an initial price of $9.50 per share
##D stock.prices <- gains_prices(gains = stock.gains, initial = 9.50)
##D 
##D # Plot minute-to-minute stock prices (200k data point, may be slow)
##D plot(stock.prices)
##D 
##D # Maximum drawdown based on stock prices
##D mdd(prices = stock.prices)
##D 
##D # Same answer using gains rather than prices
##D mdd(gains = stock.gains)
## End(Not run)





