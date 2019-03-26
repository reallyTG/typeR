library(SeqAlloc)


### Name: caitalloc
### Title: Sequential Allocation for CAIT Method
### Aliases: caitalloc
### Keywords: Covariate-Adaptive Design Imbalance Tolerance

### ** Examples

wtmat <- matrix(runif(10000), ncol=100) 
wtmat <- (wtmat * lower.tri(wtmat)) + t(wtmat * lower.tri(wtmat)) 
diag(wtmat) <- 1 

caitalloc(wtmat,1,3)



