library(ParallelPC)


### Name: pc_parallel
### Title: Estimate the Equivalence Class of a DAG using the PC_parallel
###   Algorithm
### Aliases: pc_parallel

### ** Examples

##########################################
## Using pc_parallel without mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
pc_parallel(suffStat, indepTest=gaussCItest, p=p, skel.method="parallel", alpha=0.01, num.cores=2)

##########################################
## Using pc_parallel with mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
pc_parallel(suffStat, indepTest=gaussCItest, p=p, skel.method="parallel",
alpha=0.01, num.cores=2, mem.efficient=TRUE)

#################################################
## Using pc_parallel with mutual information test
#################################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
#The first parameter is the dataset rather than suffStat
pc_parallel(gmG$x, indepTest=mig, p=p, skel.method="parallel",
alpha=0.01, num.cores=2, mem.efficient=TRUE)



