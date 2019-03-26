library(phangorn)


### Name: hadamard
### Title: Hadamard Matrices and Fast Hadamard Multiplication
### Aliases: hadamard fhm h4st h2st
### Keywords: cluster

### ** Examples


H <- hadamard(3)
v <- 1:8
H %*% v
fhm(v)

data(yeast)

# RY-coding
dat_ry <- acgt2ry(yeast)
fit2 <- h2st(dat_ry)
lento(fit2)

# write.nexus.splits(fit2, file = "test.nxs")
# read this file into Spectronet or Splitstree to show the network
## Not run: 
##D dat <- as.character(yeast)
##D dat4 <- phyDat(dat, type="USER", levels=c("a","c", "g", "t"), ambiguity=NULL)
##D fit4 <- h4st(dat4)
##D 
##D par(mfrow=c(3,1))
##D lento(fit4[[1]], main="Transversion")
##D lento(fit4[[2]], main="Transition 1")
##D lento(fit4[[3]], main="Transition 2")
## End(Not run)




