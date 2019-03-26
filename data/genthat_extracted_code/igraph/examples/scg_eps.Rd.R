library(igraph)


### Name: scg_eps
### Title: Error of the spectral coarse graining (SCG) approximation
### Aliases: scg_eps scgNormEps

### ** Examples


v <- rexp(20)
km <- kmeans(v,5)
sum(km$withinss)
scg_eps(cbind(v), km$cluster)^2



