library(riskyr)


### Name: is_valid_prob_triple
### Title: Verify that a triple of essential probability inputs is valid.
### Aliases: is_valid_prob_triple

### ** Examples

# ways to work:
is_valid_prob_triple(0, 0, 0)    # => TRUE
is_valid_prob_triple(1, 1, 1)    # => TRUE

## ways to fail:
# is_valid_prob_triple(0, 0)       # => ERROR (as no triple)
# is_valid_prob_triple(0, 0, 7)    # => FALSE + warning (beyond range)
# is_valid_prob_triple(0, NA, 0)   # => FALSE + warning (NA)
# is_valid_prob_triple("p", 0, 0)  # => FALSE + warning (non-numeric)




