library(riskyr)


### Name: is_suff_prob_set
### Title: Verify a sufficient set of probability inputs.
### Aliases: is_suff_prob_set

### ** Examples

# ways to work:
is_suff_prob_set(prev = 1, sens = 1, spec = 1)  # => TRUE
is_suff_prob_set(prev = 1, mirt = 1, spec = 1)  # => TRUE
is_suff_prob_set(prev = 1, sens = 1, fart = 1)  # => TRUE
is_suff_prob_set(prev = 1, mirt = 1, fart = 1)  # => TRUE

# watch out for:
is_suff_prob_set(prev = 1, sens = 2, spec = 3)  # => TRUE, but is_prob is FALSE
is_suff_prob_set(prev = 1, mirt = 2, fart = 4)  # => TRUE, but is_prob is FALSE
is_suff_prob_set(prev = 1, sens = 2, spec = 3, fart = 4)  # => TRUE, but is_prob is FALSE

## ways to fail:
# is_suff_prob_set()                    # => FALSE + warning (prev missing)
# is_suff_prob_set(prev = 1)            # => FALSE + warning (sens or mirt missing)
# is_suff_prob_set(prev = 1, sens = 1)  # => FALSE + warning (spec or fart missing)




