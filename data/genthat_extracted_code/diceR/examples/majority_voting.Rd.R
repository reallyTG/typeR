library(diceR)


### Name: majority_voting
### Title: Majority voting
### Aliases: majority_voting

### ** Examples

data(hgsc)
dat <- hgsc[1:100, 1:50]
cc <- consensus_cluster(dat, nk = 4, reps = 6, algorithms = "pam", progress =
FALSE)
table(majority_voting(cc[, , 1, 1, drop = FALSE], is.relabelled = FALSE))



