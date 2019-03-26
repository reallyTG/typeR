library(ParallelPC)


### Name: skeleton_parallel
### Title: Estimate (Initial) Skeleton of a DAG.
### Aliases: skeleton_parallel

### ** Examples

##########################################
## Using skeleton_parallel without mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
skeleton_parallel(suffStat,indepTest=gaussCItest,p=p,method="parallel",alpha=0.01,num_workers=2)

##########################################
## Using skeleton_parallel with mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
skeleton_parallel(suffStat,indepTest=gaussCItest,p=p,method="parallel",
alpha=0.01,num_workers=2,mem.efficient=TRUE)



