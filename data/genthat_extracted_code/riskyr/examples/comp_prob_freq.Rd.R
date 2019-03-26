library(riskyr)


### Name: comp_prob_freq
### Title: Compute probabilities from (4 essential) frequencies.
### Aliases: comp_prob_freq

### ** Examples

## Basics:
comp_prob_freq()
all.equal(prob, comp_prob_freq())  # => should be TRUE!


## Circular chain:
# 1. Current numeric parameters:
num

# 2. Compute all 10 probabilities in prob (from essential probabilities):
prob <- comp_prob()

# 3. Compute 9 frequencies in freq from probabilities:
freq <- comp_freq(round = FALSE)   # prevent rounding (to obtain same probabilities later)
freq

# 4. Compute all 10 probabilities again (but now from frequencies):
prob_freq <- comp_prob_freq()
prob_freq

# 5. Check equality of results (steps 2. and 4.):
all.equal(prob, prob_freq)  # => should be TRUE





