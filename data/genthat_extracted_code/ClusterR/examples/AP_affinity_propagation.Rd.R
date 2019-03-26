library(ClusterR)


### Name: AP_affinity_propagation
### Title: Affinity propagation clustering
### Aliases: AP_affinity_propagation

### ** Examples


set.seed(1)
dat = matrix(sample(1:255, 2500, replace = TRUE), 100, 25)

smt = 1.0 - distance_matrix(dat, method = 'euclidean', upper = TRUE, diagonal = TRUE)
diag(smt) = 0.0

ap = AP_affinity_propagation(smt, p = median(as.vector(smt))) 




