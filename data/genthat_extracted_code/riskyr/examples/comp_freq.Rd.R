library(riskyr)


### Name: comp_freq
### Title: Compute frequencies from (3 essential) probabilities.
### Aliases: comp_freq

### ** Examples

comp_freq()                  # => ok, using current defaults
length(comp_freq())          # => 11

# Ways to succeed:
comp_freq(prev = 1, sens = 1, spec = 1, 100)  # => ok, N hits (TP)
comp_freq(prev = 1, sens = 1, spec = 0, 100)  # => ok, N hits
comp_freq(prev = 1, sens = 0, spec = 1, 100)  # => ok, N misses (FN)
comp_freq(prev = 1, sens = 0, spec = 0, 100)  # => ok, N misses
comp_freq(prev = 0, sens = 1, spec = 1, 100)  # => ok, N correct rejections (TN)
comp_freq(prev = 0, sens = 1, spec = 0, 100)  # => ok, N false alarms (FP)

# Watch out for:
comp_freq(prev = 1, sens = 1, spec = 1, N = NA)  # => ok, but warning that N = 1 was computed
comp_freq(prev = 1, sens = 1, spec = 1, N =  0)  # => ok, but all 0 + warning (extreme case: N hits)
comp_freq(prev = .5, sens = .5, spec = .5, N = 10, round = TRUE)   # => ok, rounded (see mi and fa)
comp_freq(prev = .5, sens = .5, spec = .5, N = 10, round = FALSE)  # => ok, not rounded

# Ways to fail:
comp_freq(prev = NA,  sens = 1, spec = 1,  100)   # => NAs + warning (prev NA)
comp_freq(prev = 1,  sens = NA, spec = 1,  100)   # => NAs + warning (sens NA)
comp_freq(prev = 1,  sens = 1,  spec = NA, 100)   # => NAs + warning (spec NA)
comp_freq(prev = 8,  sens = 1,  spec = 1,  100)   # => NAs + warning (prev beyond range)
comp_freq(prev = 1,  sens = 8,  spec = 1,  100)   # => NAs + warning (sens beyond range)





