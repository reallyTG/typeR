library(stocks)


### Name: gains_prices
### Title: Convert Gains to Prices
### Aliases: gains_prices

### ** Examples

# Simulate daily gains over a 5-year period
set.seed(123)
gains <- rnorm(n = 252 * 5, mean = 0.001, sd = 0.02)

# Plot balance over time if initial balance is $10,000
prices <- gains_prices(gains)
plot(prices)





