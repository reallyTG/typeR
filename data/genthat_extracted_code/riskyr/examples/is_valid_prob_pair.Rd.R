library(riskyr)


### Name: is_valid_prob_pair
### Title: Verify that a pair of probability inputs can be a pair of
###   complementary probabilities.
### Aliases: is_valid_prob_pair

### ** Examples

# ways to succeed:
is_valid_prob_pair(1, 0)      # => TRUE
is_valid_prob_pair(0, 1)      # => TRUE
is_valid_prob_pair(1, NA)     # => TRUE + warning (NA)
is_valid_prob_pair(NA, 1)     # => TRUE + warning (NA)
is_valid_prob_pair(.50, .51)  # => TRUE (as within tol)

# ways to fail:
is_valid_prob_pair(.50, .52)  # => FALSE (as beyond tol)
is_valid_prob_pair(1, 2)      # => FALSE + warning (beyond range)
is_valid_prob_pair(NA, NA)    # => FALSE + warning (NA)




