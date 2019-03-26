library(stocks)


### Name: gains_rate
### Title: Calculate Growth Rate From a Vector of Gains
### Aliases: gains_rate

### ** Examples

# Create vector of daily gains for a hypothetical stock
daily.gains <- c(-0.02, -0.01, 0.01, 0.02, 0.01)

# Overall growth is 0.95%
gains_rate(daily.gains)

# Average daily growth is 0.19%
gains_rate(daily.gains, 1)

# Corresponds to 61.0% annual growth
gains_rate(daily.gains, 252)





