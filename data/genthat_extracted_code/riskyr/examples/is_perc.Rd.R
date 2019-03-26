library(riskyr)


### Name: is_perc
### Title: Verify that input is a percentage (numeric value from 0 to 100).
### Aliases: is_perc

### ** Examples

# ways to succeed:
is_perc(2)           # => TRUE, but does NOT return the percentage 2.
is_perc(1/2)         # => TRUE, but does NOT return the percentage 0.5.
pc.sq <- seq(0, 100, by = 10)
is_perc(pc.sq)       # => TRUE (for vector)

# ways to fail:
is_perc(NA)          # => FALSE + warning (NA values)
is_perc(NaN)         # => FALSE + warning (NaN values)
is_perc("Bernoulli") # => FALSE + warning (non-numeric values)
is_perc(101)         # => FALSE + warning (beyond range)




