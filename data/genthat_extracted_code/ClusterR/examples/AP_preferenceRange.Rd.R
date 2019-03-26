library(ClusterR)


### Name: AP_preferenceRange
### Title: Affinity propagation preference range
### Aliases: AP_preferenceRange

### ** Examples


set.seed(1)
dat = matrix(sample(1:255, 2500, replace = TRUE), 100, 25)

smt = 1.0 - distance_matrix(dat, method = 'euclidean', upper = TRUE, diagonal = TRUE)
diag(smt) = 0.0

ap_range = AP_preferenceRange(smt, method = "bound") 




