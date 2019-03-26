library(riskyr)


### Name: comp_sens
### Title: Compute a decision's sensitivity from its miss rate.
### Aliases: comp_sens

### ** Examples

comp_sens(2)                      # => NA + warning (beyond range)
comp_sens(1/3)                    # => 0.6666667
comp_sens(comp_complement(0.123))  # => 0.123




