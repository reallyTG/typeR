library(riskyr)


### Name: comp_spec
### Title: Compute a decision's specificity from its false alarm rate.
### Aliases: comp_spec

### ** Examples

comp_spec(2)                      # => NA + warning (beyond range)
comp_spec(1/3)                    # => 0.6666667
comp_spec(comp_complement(0.123))  # => 0.123




