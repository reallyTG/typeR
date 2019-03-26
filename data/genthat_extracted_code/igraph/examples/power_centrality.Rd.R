library(igraph)


### Name: power_centrality
### Title: Find Bonacich Power Centrality Scores of Network Positions
### Aliases: power_centrality bonpow
### Keywords: graphs

### ** Examples


# Generate some test data from Bonacich, 1987:
g.c <- graph( c(1,2,1,3,2,4,3,5), dir=FALSE)
g.d <- graph( c(1,2,1,3,1,4,2,5,3,6,4,7), dir=FALSE)
g.e <- graph( c(1,2,1,3,1,4,2,5,2,6,3,7,3,8,4,9,4,10), dir=FALSE)
g.f <- graph( c(1,2,1,3,1,4,2,5,2,6,2,7,3,8,3,9,3,10,4,11,4,12,4,13), dir=FALSE)
# Compute power centrality scores
for (e in seq(-0.5,.5, by=0.1)) {
  print(round(power_centrality(g.c, exp=e)[c(1,2,4)], 2))
}

for (e in seq(-0.4,.4, by=0.1)) {
  print(round(power_centrality(g.d, exp=e)[c(1,2,5)], 2))
}

for (e in seq(-0.4,.4, by=0.1)) {
  print(round(power_centrality(g.e, exp=e)[c(1,2,5)], 2))
}

for (e in seq(-0.4,.4, by=0.1)) {
  print(round(power_centrality(g.f, exp=e)[c(1,2,5)], 2))
}




