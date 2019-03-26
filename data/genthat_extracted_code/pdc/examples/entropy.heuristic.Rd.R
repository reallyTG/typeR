library(pdc)


### Name: entropyHeuristic
### Title: Minimum Entropy Heuristic (MinE)
### Aliases: entropy.heuristic entropyHeuristic plot.mine print.mine
###   summary.mine

### ** Examples


# (1)
#
# create a sine-wave with added noise
# and display a plot showing the average permutation entropy
# depending on varying choices of the embedding size
# (by default time-delay is not searched over)

heuristic <-  entropyHeuristic( sin(1:100)+rnorm(100,0,1) )
plot(heuristic)


# (2)
#
# calculate both optimal embedding dimension and time-delay
#
heuristic <-  entropyHeuristic( sin(1:100)+rnorm(100,0,1), t.min=1, t.max=6 )
plot(heuristic)





