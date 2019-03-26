library(sigr)


### Name: Bernoulli_diff_stat
### Title: Compute the distribution of differences of replacement samples
###   of two Binomial or Bernoulli experiments.
### Aliases: Bernoulli_diff_stat

### ** Examples


Bernoulli_diff_stat(2000, 5000, 100, 200)
Bernoulli_diff_stat(2000, 5000, 100, 200, 0.1)
Bernoulli_diff_stat(2000, 5000, 100, 199)
Bernoulli_diff_stat(2000, 5000, 100, 199, 0.1)
Bernoulli_diff_stat(100, 200, 2000, 5000)

# sigr adjusts experiment sizes when lengths
# don't divide into each other.
Bernoulli_diff_stat(100, 199, 2000, 5000)
Bernoulli_diff_stat(100, 199, 2000, 5000)$pValue




