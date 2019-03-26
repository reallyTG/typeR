library(stuart)


### Name: bruteforce
### Title: Subtest construction using a brute-force approach
### Aliases: bruteforce

### ** Examples


# Bruteforce selection in a minimal example
# selecting 3 of 5 items
# requires lavaan
data(fairplayer)
fs <- list(ra = names(fairplayer)[53:57])
sel <- bruteforce(fairplayer, fs, 3,
  cores = 1)  # number of cores set to 1
summary(sel)  # Fit is perfect because of just-identified model




