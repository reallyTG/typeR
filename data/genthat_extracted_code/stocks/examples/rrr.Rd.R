library(stocks)


### Name: rrr
### Title: Risk-Return Ratio
### Aliases: rrr

### ** Examples

# Simulate daily gains over a 5-year period
set.seed(123)
stock.gains <- rnorm(252 * 5, 0.0005, 0.01)

# Convert to daily balances assuming an initial balance of $10,000
daily.balances <- gains_prices(stock.gains + 1)

# Total return is about 1.23
daily.balances[length(daily.balances)] / daily.balances[1] - 1

# Maximum drawdown is about 0.19
mdd(prices = daily.balances)

# Ratio of these two is about 6.48
(daily.balances[length(daily.balances)] / daily.balances[1] - 1) / 
mdd(daily.balances)

# Easier to calculate using rrr function
rrr(daily.balances)





