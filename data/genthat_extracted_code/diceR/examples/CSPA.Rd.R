library(diceR)


### Name: CSPA
### Title: Cluster-based Similarity Partitioning Algorithm (CSPA)
### Aliases: CSPA

### ** Examples

data(hgsc)
dat <- hgsc[1:100, 1:50]
x <- consensus_cluster(dat, nk = 4, reps = 4, algorithms = c("hc", "diana"),
progress = FALSE)
CSPA(x, k = 4)



