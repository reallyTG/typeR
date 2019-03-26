library(PlackettLuce)


### Name: grouped_rankings
### Title: Grouped Rankings Object
### Aliases: grouped_rankings [.grouped_rankings as.grouped_rankings
###   as.grouped_rankings.paircomp format.grouped_rankings

### ** Examples


# ungrouped rankings (5 rankings, 4 items)
R <- as.rankings(matrix(c(1, 2, 0, 0,
                          0, 2, 1, 0,
                          0, 0, 1, 2,
                          2, 1, 0, 0,
                          0, 1, 2, 3), ncol = 4, byrow = TRUE))
length(R)
R

# grouped rankings (first three in group 1, next two in group 2)
G <- grouped_rankings(R, c(1, 1, 1, 2, 2))
length(G)
## by default up to 2 rankings are shown per group, "..." indicates if
## there are further rankings
G
print(G, max = 1)
## select rankings from group 1
G[1,]
## exclude item 3 from ranking
G[, -3]
## rankings from group 2, excluding item 3
## - note group 2 becomes the first group
G[2, -3]
## index underlying rankings without creating new grouped_rankings object
G[2, -3, as.grouped_rankings = FALSE]



