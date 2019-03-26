library(riskyr)


### Name: comp_min_N
### Title: Compute a suitable minimum population size value N.
### Aliases: comp_min_N

### ** Examples

comp_min_N(0, 0, 0)  # => 1
comp_min_N(1, 1, 1)  # => 1

comp_min_N(1, 1, 1, min.freq = 10)  # =>  10
comp_min_N(1, 1, 1, min.freq = 99)  # => 100

comp_min_N(.1, .1, .1)        # =>       100 = 10^2
comp_min_N(.001, .1, .1)      # =>    10 000 = 10^4
comp_min_N(.001, .001, .1)    # => 1 000 000 = 10^6
comp_min_N(.001, .001, .001)  # => 1 000 000 = 10^6





