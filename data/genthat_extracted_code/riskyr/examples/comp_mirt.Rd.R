library(riskyr)


### Name: comp_mirt
### Title: Compute a decision's miss rate from its sensitivity.
### Aliases: comp_mirt

### ** Examples

comp_mirt(2)                      # => NA + warning (beyond range)
comp_mirt(1/3)                    # => 0.6666667
comp_mirt(comp_complement(0.123))  # => 0.123




