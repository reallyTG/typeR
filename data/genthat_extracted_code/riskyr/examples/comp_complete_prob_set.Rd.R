library(riskyr)


### Name: comp_complete_prob_set
### Title: Compute a complete set of probabilities from valid probability
###   inputs.
### Aliases: comp_complete_prob_set

### ** Examples

# ways to work:
comp_complete_prob_set(1, .8, NA, .7, NA) # => 1.0 0.8 0.2 0.7 0.3
comp_complete_prob_set(1, NA, .8, NA, .4) # => 1.0 0.2 0.8 0.6 0.4

# watch out for:
comp_complete_prob_set(8)                  # => 8 NA NA NA NA + warnings
comp_complete_prob_set(8, 7, 6, 5, 4)      # => 8 7 6 5 4 + no warning (valid set assumed)
comp_complete_prob_set(8, .8, NA, .7, NA)  # => 8.0 0.8 0.2 0.7 0.3 + no warning (sic)
comp_complete_prob_set(8, 2, NA, 3, NA)    # => 8 2 NA 3 NA + no warning (sic)




