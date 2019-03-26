library(ParallelPC)


### Name: pc_stable
### Title: Estimate the Equivalence Class of a DAG using the PC_stable
###   Algorithm
### Aliases: pc_stable

### ** Examples

##########################################
## Using pc_stable
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
pc_stable(suffStat, indepTest=gaussCItest, p=p, skel.method="stable", alpha=0.01)



