library(riskyr)


### Name: comp_fart
### Title: Compute a decision's false alarm rate from its specificity.
### Aliases: comp_fart

### ** Examples

comp_fart(2)                       # => NA + warning (beyond range)
comp_fart(1/3)                     # => 0.6666667
comp_fart(comp_complement(0.123))  # => 0.123




