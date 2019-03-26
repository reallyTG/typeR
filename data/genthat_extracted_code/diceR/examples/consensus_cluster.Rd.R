library(diceR)


### Name: consensus_cluster
### Title: Consensus clustering
### Aliases: consensus_cluster

### ** Examples

data(hgsc)
dat <- hgsc[1:100, 1:50]

# Custom distance function
manh <- function(x) {
  stats::dist(x, method = "manhattan")
}

# Custom clustering algorithm
agnes <- function(d, k) {
  return(as.integer(stats::cutree(cluster::agnes(d, diss = TRUE), k)))
}

assign("agnes", agnes, 1)

cc <- consensus_cluster(dat, reps = 6, algorithms = c("pam", "agnes"),
distance = c("euclidean", "manh"), progress = FALSE)
str(cc)



