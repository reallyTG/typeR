library(engsoccerdata)


### Name: n_offs
### Title: Return Scorelines that only occurred n times in history
### Aliases: n_offs

### ** Examples

n_offs(england, 1) #return results that have occurred only once across all four tiers
n_offs(england, 2) #return results that have occurred only twice across all four tiers
n_offs(england, 3) #return results that have occurred 3 times across all four tiers

n_offs(england, 1, 1) #return which results have occurred only once in the top tier
n_offs(england, 1, 4) #return which results have occurred only once in the 4th tier
n_offs(england, 2, 2) #return which results have occurred twice in the 2nd tier
n_offs(england, 5, 3) #return which results have occurred five times in the 3rd tier




