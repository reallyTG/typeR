library(SeqAlloc)


### Name: MAICimbal
### Title: Maximum Allocation Imbalance for Covariates
### Aliases: MAICimbal
### Keywords: Allocation Imbalance

### ** Examples

alloc <- rbinom(60,1,.5)
xmat <- matrix(rbinom(240,1,.4),ncol=4)

MAICimbal(alloc, xmat) 



