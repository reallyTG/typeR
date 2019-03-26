library(MXM)


### Name: Skeleton (local) around a node of the max-min hill-climbing (MMHC) algorithm
### Title: Skeleton (local) around a node of the MMHC algorithm
### Aliases: local.mmhc.skel
### Keywords: MMHC algorithm

### ** Examples

# simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 30, 1, 100), nrow = 1000 ) 
a1 <- mmhc.skel(dataset, max_k = 3, threshold = 0.05, test = "testIndFisher") 
a2 <- local.mmhc.skel(dataset, 4)
a1$runtime  
a2$runtime 

dataset <- rdag2(1000, p = 20, nei = 4)$x
a1 <- mmhc.skel(dataset, max_k = 3, threshold = 0.05, test = "testIndFisher") 
a2 <- local.mmhc.skel(dataset, 5)
a1$runtime  
a2$runtime 





