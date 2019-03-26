library(riskyr)


### Name: comp_FOR
### Title: Compute a decision's false omission rate (FOR) from
###   probabilities.
### Aliases: comp_FOR

### ** Examples

# (1) Ways to work:
comp_FOR(.50, .500, .500)  # => FOR = 0.5    = (1 - NPV)
comp_FOR(.50, .333, .666)  # => FOR = 0.5004 = (1 - NPV)





