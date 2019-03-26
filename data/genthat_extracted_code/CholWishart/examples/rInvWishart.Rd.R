library(CholWishart)


### Name: rInvWishart
### Title: Random Inverse Wishart Distributed Matrices
### Aliases: rInvWishart

### ** Examples

set.seed(20180221)
A<-rInvWishart(1,10,5*diag(5))[,,1]
set.seed(20180221)
B<-stats::rWishart(1,10,.2*diag(5))[,,1]

A %*% B



