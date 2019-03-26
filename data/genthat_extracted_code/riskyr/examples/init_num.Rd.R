library(riskyr)


### Name: init_num
### Title: Initialize basic numeric variables.
### Aliases: init_num

### ** Examples

# ways to succeed:
init_num(1, 1, 1, 0, 100)  # => succeeds
init_num(1, 1, 0, 1, 100)  # => succeeds

# watch out for:
init_num(1, 1, 0, 1)           # => succeeds (with N computed)
init_num(1, 1, NA, 1, 100)     # => succeeds (with spec computed)
init_num(1, 1, 0, NA, 100)     # => succeeds (with fart computed)
init_num(1, 1, NA, 1)          # => succeeds (with spec and N computed)
init_num(1, 1, 0, NA)          # => succeeds (with fart and N computed)
init_num(1, 1, .51, .50, 100)  # => succeeds (as spec and fart are within tolarated range)

# ways to fail:
init_num(prev = NA)                                  # => NAs + warning (NA)
init_num(prev = 88)                                  # => NAs + warning (beyond range)
init_num(prev =  1, sens = NA)                       # => NAs + warning (NA)
init_num(prev =  1, sens = 1, spec = NA, fart = NA)  # => NAs + warning (NAs)
init_num(1, 1, .52, .50, 100)   # => NAs + warning (complements beyond range)





