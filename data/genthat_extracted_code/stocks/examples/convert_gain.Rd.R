library(stocks)


### Name: convert_gain
### Title: Convert Gain from One Time Interval to Another
### Aliases: convert_gain

### ** Examples

# Calculate annualized gain for an 8% gain over a 70-day period
convert_gain(gain = 0.08, units.in = 70, units.out = 252)

# Calculate the annual growth rate of a fund that gains 0.02% per day
convert_gain(gain = 0.0002, units.in = 1, units.out = 252)

# Calculate the annual growth rate of a fund that gains 1% per week
convert_gain(gain = 0.01, units.in = 1, units.out = 52)

# You invest in AAPL and gain 0.5% in 17 business days. Express as a 5-year
# growth rate.
convert_gain(gain = 0.005, units.in = 17, units.out = 252 * 5)

# Your portfolio has tripled in a 13-year period. Calculate your average 
# annual gain.
convert_gain(gain = 2, units.in = 13, units.out = 1)





