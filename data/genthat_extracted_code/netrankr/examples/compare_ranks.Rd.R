library(netrankr)


### Name: compare_ranks
### Title: Count occurrences of pairs in rankings
### Aliases: compare_ranks

### ** Examples

library(igraph)
tg <- threshold_graph(100,0.2)
compare_ranks(degree(tg),closeness(tg)) #only concordant pairs
compare_ranks(degree(tg),betweenness(tg)) #no discordant pairs
## Rank Correlation
cor(degree(tg),closeness(tg),method='kendall') #1
cor(degree(tg),betweenness(tg),method='kendall') #not 1, although no discordant pairs



