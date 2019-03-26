library(MXM)


### Name: Skeleton of the max-min hill-climbing (MMHC) algorithm
### Title: The skeleton of a Bayesian network as produced by MMHC
### Aliases: mmhc.skel glmm.mmhc.skel gee.mmhc.skel
### Keywords: MMHC algorithm

### ** Examples

# simulate a dataset with continuous data
y <- rdag2(500, p = 20, nei = 3)
x <- y$x
a <- mmhc.skel(x, max_k = 5, threshold = 0.01, test = "testIndFisher" ) 
b <- pc.skel( x, alpha = 0.01 ) 
a$runtime ## 
b$runtime ## 
 



