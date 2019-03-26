library(ParallelPC)


### Name: fci_stable
### Title: Estimate a PAG, using the FCI_stable algorithm
### Aliases: fci_stable

### ** Examples

##########################################
## Using fci_stable
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
fci_stable(suffStat, indepTest=gaussCItest, p=p, skel.method="stable", alpha=0.01)



