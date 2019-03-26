library(riskyr)


### Name: comp_acc
### Title: Compute overall accuracy (acc) from probabilities.
### Aliases: comp_acc

### ** Examples

# ways to work:
comp_acc(.10, .200, .300)  # => acc = 0.29
comp_acc(.50, .333, .666)  # => acc = 0.4995

# watch out for vectors:
prev.range <- seq(0, 1, by = .1)
comp_acc(prev.range, .5, .5)  # => 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5

# watch out for extreme values:
comp_acc(1, 1, 1)  #  => 1
comp_acc(1, 1, 0)  #  => 1

comp_acc(1, 0, 1)  #  => 0
comp_acc(1, 0, 0)  #  => 0

comp_acc(0, 1, 1)  #  => 1
comp_acc(0, 1, 0)  #  => 0

comp_acc(0, 0, 1)  #  => 1
comp_acc(0, 0, 0)  #  => 0





