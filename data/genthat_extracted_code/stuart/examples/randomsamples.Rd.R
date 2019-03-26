library(stuart)


### Name: randomsamples
### Title: Generating random samples of Subtests
### Aliases: randomsamples

### ** Examples


# Random samples in a simple situation
# requires lavaan
# number of cores set to 1 in all examples
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])

# 10 random solutions, report median solution
sel <- randomsamples(fairplayer, fs, 4, 
  n = 10, percentile = 50,
  seed = 55635, cores = 1)
summary(sel)





