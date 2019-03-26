library(phylotaR)


### Name: get_nsqs
### Title: Count number of sequences
### Aliases: get_nsqs

### ** Examples

data("cycads")
# count seqs for a random 10 clusters
random_cids <- sample(cycads@cids, 10)
nsqs <- get_nsqs(phylota = cycads, cid = random_cids)



