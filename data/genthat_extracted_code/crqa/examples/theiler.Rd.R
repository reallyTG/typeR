library(crqa)


### Name: theiler
### Title: Theiler window
### Aliases: theiler

### ** Examples


## build a random x matrix
r = 100; c = 100; tw = 1
S = round(matrix(runif(r*c), r, c))

ans = theiler(S, tw)




