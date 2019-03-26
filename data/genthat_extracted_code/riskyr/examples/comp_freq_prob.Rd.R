library(riskyr)


### Name: comp_freq_prob
### Title: Compute frequencies from (3 essential) probabilities.
### Aliases: comp_freq_prob

### ** Examples

# Basics:
comp_freq_prob(prev = .1, sens = .9, spec = .8, N = 100)           # => ok: hi = 9, ... cr = 72.
# Same case with complements (using NAs to prevent defaults):
comp_freq_prob(prev = .1, sens = NA, mirt = .1, spec = NA, fart = .2, N = 100)  # => same result

comp_freq_prob()                   # => ok, using probability info currently contained in prob
length(comp_freq_prob())           # => a list containing 9 frequencies
all.equal(freq, comp_freq_prob())  # => TRUE, unless prob has been changed after computing freq
freq <- comp_freq_prob()           # => computes frequencies and stores them in freq

# Ways to work:
comp_freq_prob(prev = 1, sens = 1, spec = 1, N = 101)  # => ok + warning: N hits (TP)

# Same case with complements (using NAs to prevent defaults):
comp_freq_prob(prev = 1, sens = NA, mirt = 0, spec = NA, fart = 0, N = 101)

comp_freq_prob(prev = 1, sens = 1, spec = 0, N = 102)  # => ok + warning: N hits (TP)
comp_freq_prob(prev = 1, sens = 0, spec = 1, N = 103)  # => ok + warning: N misses (FN)
comp_freq_prob(prev = 1, sens = 0, spec = 0, N = 104)  # => ok + warning: N misses (FN)
comp_freq_prob(prev = 0, sens = 1, spec = 1, N = 105)  # => ok + warning: N correct rejections (TN)

comp_freq_prob(prev = 0, sens = 1, spec = 0, N = 106)  # => ok + warning: N false alarms (FP)

# Same case with complements (using NAs to prevent defaults):
comp_freq_prob(prev = 0, sens = NA, mirt = 0,
               spec = NA, fart = 1, N = 106)  # => ok + warning: N false alarms (FP)

# Watch out for:
comp_freq_prob(prev = 1, sens = 1, spec = 1, N = NA)  # => ok + warning: N = 1 computed
comp_freq_prob(prev = 1, sens = 1, spec = 1, N =  0)  # => ok, but all 0 + warning (NPV = NaN)
comp_freq_prob(prev = .5, sens = .5, spec = .5, N = 10, round = TRUE)  # => ok, but all rounded
comp_freq_prob(prev = .5, sens = .5, spec = .5, N = 10, round = FALSE) # => ok, but not rounded

# Ways to fail:
comp_freq_prob(prev = NA, sens = 1, spec = 1, 100)  # => NAs + no warning (prev NA)
comp_freq_prob(prev = 1, sens = NA, spec = 1, 100)  # => NAs + no warning (sens NA)
comp_freq_prob(prev = 1, sens = 1, spec = NA, 100)  # => NAs + no warning (spec NA)
comp_freq_prob(prev = 8, sens = 1, spec = 1,  100)  # => NAs + warning (prev beyond range)
comp_freq_prob(prev = 1, sens = 8, spec = 1,  100)  # => NAs + warning (sens & spec beyond range)





