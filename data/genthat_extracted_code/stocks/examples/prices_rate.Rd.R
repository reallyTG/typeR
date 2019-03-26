library(stocks)


### Name: prices_rate
### Title: Calculate Growth Rate From a Vector of Prices
### Aliases: prices_rate

### ** Examples

# Create vector of daily closing prices for a hypothetical stock
prices <- c(100.4, 98.7, 101.3, 101.0, 100.9)

# Overall growth is 0.50%
prices_rate(prices)

# Average daily growth is 0.12%
prices_rate(prices, 1)

# Corresponds to 36.7% annualized growth
prices_rate(prices, 252)





