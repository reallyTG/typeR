library(ParallelPC)


### Name: rfci_stable
### Title: Estimate a PAG using the RFCI_stable Algorithm
### Aliases: rfci_stable

### ** Examples

##########################################
## Using rfci_stable
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
rfci_stable(suffStat, indepTest=gaussCItest, p=p, skel.method="stable", alpha=0.01)



