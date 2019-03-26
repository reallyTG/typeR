library(MXM)


### Name: Utilities for the skeleton of a (Bayesian) Network
### Title: Utilities for the skeleton of a (Bayesian) Network
### Aliases: bn.skel.utils bn.skel.utils2

### ** Examples

## simulate a dataset with continuous data
y <- rdag2(500, p = 25, nei = 3)
ind <- sample(1:25, 25)
x <- y$x[, ind]
mod <- pc.skel( x, method = "comb.fast", alpha = 0.01 ) 
G <- y$G[ind, ind]
G <- G + t(G)
bn.skel.utils(mod, G, roc = FALSE, alpha = 0.01) 
bn.skel.utils2(mod, G, roc = FALSE, alpha = 0.01) 



