library(stuart)


### Name: heuristics
### Title: Generating heuristics for the use in STUART subtest construction
### Aliases: heuristics

### ** Examples


# heuristics for node localization
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])

(heu <- heuristics(fairplayer, fs, 4))

# Define anchor-item
heu$si[1] <- 10000
heu

# heuristics for arc localization
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])

(heu <- heuristics(fairplayer, fs, 4, localization = 'arcs'))

# Define equal selection of odd and even items
heu$si[1:10,] <- c(rep(c(0, 1), 5), rep(c(1, 0), 5))
heu




