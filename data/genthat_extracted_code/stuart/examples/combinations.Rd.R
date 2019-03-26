library(stuart)


### Name: combinations
### Title: Compute the number of possible subtest combinations
### Aliases: combinations

### ** Examples


# Determine number of combinations in a simple situation
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])
combinations(fairplayer, fs, 4)

# Number of combinations with repeated measures
data(fairplayer)
fs <- list(si1 = names(fairplayer)[83:92],
  si2 = names(fairplayer)[93:102],
  si3 = names(fairplayer)[103:112])
repe <- list(si = c('si1', 'si2', 'si3'))
combinations(fairplayer, fs, 4, repeated.measures = repe)




