library(SeqAlloc)


### Name: covimbal
### Title: Evaluate covariate imbalance using R-squared.
### Aliases: covimbal
### Keywords: Allocation Imbalance

### ** Examples

alloc <- rbinom(60,1,.5)
xmat <- matrix(rbinom(240,1,.4),ncol=4)
xmatc <- scale(xmat,center=TRUE,scale=FALSE) 

covimbal(alloc,xmatc)



