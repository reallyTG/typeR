library(stuart)


### Name: crossvalidate
### Title: Cross-Validate a Measurement Model
### Aliases: crossvalidate

### ** Examples


# Split data into two halves
data(fairplayer)
half1 <- fairplayer[1:72,]
half2 <- fairplayer[73:143,]

# Simple example from bruteforce
fs <- list(ra = names(fairplayer)[53:57])
sel <- bruteforce(half1, fs, 3,
  cores = 1)  # number of cores set to 1

# Validation
crossvalidate(sel, half1, half2, 
  invariance = 'strong')  # assuming equality of loadings and intercepts

# Using the 'holdout' function for data split
data(fairplayer)
split <- holdout(fairplayer, seed = 55635)

# Simple example from bruteforce
fs <- list(ra = names(fairplayer)[53:57])
sel <- bruteforce(split, fs, 3,
  cores = 1)  # number of cores set to 1

# Validation
crossvalidate(sel, split,
  invariance = 'weak')  # assuming equality of loadings




