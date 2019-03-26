library(ParallelPC)


### Name: skeleton_stable
### Title: Estimate (Initial) Skeleton of a DAG using the PC_stable
###   Algorithm
### Aliases: skeleton_stable

### ** Examples

##########################################
## Using skeleton_stable
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
skeleton_stable(suffStat, indepTest=gaussCItest, p=p, method="stable", alpha=0.01)



