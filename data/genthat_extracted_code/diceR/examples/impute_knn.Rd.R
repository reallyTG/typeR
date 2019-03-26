library(diceR)


### Name: impute_knn
### Title: K-Nearest Neighbours imputation
### Aliases: impute_knn

### ** Examples

data(hgsc)
dat <- hgsc[1:100, 1:50]
x <- consensus_cluster(dat, nk = 4, reps = 4, algorithms = c("km", "hc",
"diana"), progress = FALSE)
x <- apply(x, 2:4, impute_knn, data = dat, seed = 1)



