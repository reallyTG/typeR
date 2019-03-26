library(MXM)


### Name: Total causal effect of a node on another node
### Title: Total causal effect of a node on another node
### Aliases: ida

### ** Examples

dataset <- rdag2(1000, p=20, nei = 3)$x
mod <- pc.skel(dataset ,alpha = 0.01)
G <- pc.or(mod)$G
ida(10, 15, G, dataset)



