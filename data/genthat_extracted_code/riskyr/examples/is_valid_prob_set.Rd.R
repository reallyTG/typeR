library(riskyr)


### Name: is_valid_prob_set
### Title: Verify that a set of probability inputs is valid.
### Aliases: is_valid_prob_set

### ** Examples

## ways to succeed:
is_valid_prob_set(1, 1, 0, 1, 0)                 # => TRUE
is_valid_prob_set(.3, .9, .1, .8, .2)            # => TRUE
is_valid_prob_set(.3, .9, .1, .8, NA)            # => TRUE + warning (NA)
is_valid_prob_set(.3, .9, NA, .8, NA)            # => TRUE + warning (NAs)
is_valid_prob_set(.3, .9, NA, NA, .8)            # => TRUE + warning (NAs)
is_valid_prob_set(.3, .8, .1, .7, .2, tol = .1)  # => TRUE (due to increased tol)

## watch out for:
is_valid_prob_set(1, 0, 1, 0, 1)    # => TRUE, but NO warning about extreme case!
is_valid_prob_set(1, 1, 0, 1, 0)    # => TRUE, but NO warning about extreme case!
is_valid_prob_set(1, 1, 0, 1, NA)   # => TRUE, but NO warning about extreme case!
is_valid_prob_set(1, 1, 0, NA, 1)   # => TRUE, but NO warning about extreme case!
is_valid_prob_set(1, 1, 0, NA, 0)   # => TRUE, but NO warning about extreme case!

## ways to fail:
is_valid_prob_set(8, 1, 0, 1, 0)      # => FALSE + warning (is_prob fails)
is_valid_prob_set(1, 1, 8, 1, 0)      # => FALSE + warning (is_prob fails)
is_valid_prob_set(2, 1, 3, 1, 4)      # => FALSE + warning (is_prob fails)
is_valid_prob_set(1, .8, .2, .7, .2)  # => FALSE + warning (beyond complement range)
is_valid_prob_set(1, .8, .3, .7, .3)  # => FALSE + warning (beyond complement range)
is_valid_prob_set(1, 1, 1, 1, 1)      # => FALSE + warning (beyond complement range)
is_valid_prob_set(1, 1, 0, 1, 1)      # => FALSE + warning (beyond complement range)




