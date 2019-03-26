library(stocks)


### Name: daily_yearly
### Title: Convert Daily Gain to X-year Gain
### Aliases: daily_yearly

### ** Examples

# Calculate annual gain for an investment that gains 0.1% per day
daily_yearly(gain = 0.001)

# Calculate 5-year gains corresponding to various daily gains
daily_yearly(gain = seq(0, 0.001, 0.0001), years = 5)





