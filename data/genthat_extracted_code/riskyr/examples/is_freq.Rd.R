library(riskyr)


### Name: is_freq
### Title: Verify that input is a frequency (positive integer value).
### Aliases: is_freq

### ** Examples

# ways to succeed:
is_freq(2)             # => TRUE, but does NOT return the frequency 2.
is_freq(1:3)           # => TRUE (for vector)

# ways to fail:
is_freq(-1)            # => FALSE + warning (negative values)
is_freq(1:-1)          # => FALSE (for vector) + warning (negative values)
is_freq(c(1, 1.5, 2))  # => FALSE (for vector) + warning (non-integer values)

## Note that:
is.integer(2)          # => FALSE!




