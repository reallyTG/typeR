library(riskyr)


### Name: comp_comp_pair
### Title: Compute a probability's (missing) complement and return both.
### Aliases: comp_comp_pair

### ** Examples

# ways to work:
comp_comp_pair(1, 0)   # => 1 0
comp_comp_pair(0, 1)   # => 0 1
comp_comp_pair(1, NA)  # => 1 0
comp_comp_pair(NA, 1)  # => 0 1

# watch out for:
comp_comp_pair(NA, NA) # => NA NA + warning
comp_comp_pair(8, 8)   # => 8 8 + NO warning (as is_prob is not verified)
comp_comp_pair(1, 1)   # => 1 1 + NO warning (as is_complement is not verified)




