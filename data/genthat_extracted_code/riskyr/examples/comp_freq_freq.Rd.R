library(riskyr)


### Name: comp_freq_freq
### Title: Compute frequencies from (4 essential) frequencies.
### Aliases: comp_freq_freq

### ** Examples

## Basics:
comp_freq_freq()
all.equal(freq, comp_freq_freq())  # => should be TRUE


## Circular chain:
# 1. Current numeric parameters:
num

# 2. Compute all 10 probabilities in prob (from essential probabilities):
prob <- comp_prob()
prob

# 3. Compute 9 frequencies in freq from probabilities:
freq <- comp_freq(round = FALSE)   # no rounding (to obtain same probabilities later)
freq

# 4. Compute 9 frequencies AGAIN (but now from frequencies):
freq_freq <- comp_freq_freq()

# 5. Check equality of results (steps 2. and 4.):
all.equal(freq, freq_freq)  # => should be TRUE!





