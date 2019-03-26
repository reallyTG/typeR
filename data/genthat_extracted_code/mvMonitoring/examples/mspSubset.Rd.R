library(mvMonitoring)


### Name: mspSubset
### Title: Multi-State Subsetting
### Aliases: mspSubset

### ** Examples

nrml <- mspProcessData(faults = "NOC")

sub1 <- c(TRUE,TRUE,FALSE)
sub2 <- c(TRUE,FALSE,TRUE)
sub3 <- c(TRUE,FALSE,FALSE)
submatrix <- t(matrix(c(sub1,sub2,sub3),nrow=3,ncol=3))

subsets <- mspSubset(data = nrml[,-1],
labelVector = nrml[,1],
subsetMatrix = submatrix)



