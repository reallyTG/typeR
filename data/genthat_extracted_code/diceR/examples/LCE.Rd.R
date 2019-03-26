library(diceR)


### Name: LCE
### Title: Linkage Clustering Ensemble
### Aliases: LCE

### ** Examples

data(hgsc)
dat <- hgsc[1:100, 1:50]
x <- consensus_cluster(dat, nk = 4, reps = 4, algorithms = c("km", "hc"),
progress = FALSE)
## Not run: 
##D LCE(E = x, k = 4, sim.mat = "asrs")
## End(Not run)

x <- apply(x, 2:4, impute_knn, data = dat, seed = 1)
x_imputed <- impute_missing(x, dat, nk = 4)
LCE(E = x_imputed, k = 4, sim.mat = "cts")



