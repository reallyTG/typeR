library(gtcorr)


### Name: gtcorr.hierarchical.user
### Title: Calculate the efficiency of hierarchical group testing
###   procedures for user specified arrangements
### Aliases: gtcorr.hierarchical.user

### ** Examples

##Calculate the efficiency of a two stage hierarchical procedure with
##n[1]=20, where the first cluster has 10 units and the second and third
##clusters have 5 units each.
n <- 20
clusters <- c(rep(1,10), rep(2, 5), rep(3, 5))
p <- .1
sigma <- .3
gtcorr.hierarchical.user(n, clusters, p, sigma)



