library(MXM)


### Name: Skeleton of the PC algorithm
### Title: The skeleton of a Bayesian network produced by the PC algorithm
### Aliases: pc.skel pc.con pc.skel.boot glmm.pc.skel gee.pc.skel
### Keywords: pc algorithm

### ** Examples

# simulate a dataset with continuous data
y <- rdag2(500, p = 20, nei = 3)
ind <- sample(1:20, 20)
x <- y$x[, ind]
a <- mmhc.skel(x, max_k = 3, threshold = 0.05, test = "testIndFisher" ) 
b <- pc.skel( x, method = "pearson", alpha = 0.05 ) 
a$runtime ## 
b$runtime ## 




