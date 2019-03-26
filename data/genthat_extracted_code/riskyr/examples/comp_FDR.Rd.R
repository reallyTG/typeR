library(riskyr)


### Name: comp_FDR
### Title: Compute a decision's false detection rate (FDR) from
###   probabilities.
### Aliases: comp_FDR

### ** Examples

# (1) Ways to work:
comp_FDR(.50, .500, .500)  # => FDR = 0.5    = (1 - PPV)
comp_FDR(.50, .333, .666)  # => FDR = 0.5007 = (1 - PPV)





