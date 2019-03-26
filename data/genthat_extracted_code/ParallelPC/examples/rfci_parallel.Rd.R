library(ParallelPC)


### Name: rfci_parallel
### Title: Estimate a PAG fast using the RFCI_parallel Algorithm
### Aliases: rfci_parallel

### ** Examples

##########################################
## Using rfci_parallel without mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
rfci_parallel(suffStat, indepTest=gaussCItest, p=p, skel.method="parallel", alpha=0.01, num.cores=2)

##########################################
## Using rfci_parallel with mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
rfci_parallel(suffStat, indepTest=gaussCItest, p=p, skel.method="parallel",
alpha=0.01, num.cores=2, mem.efficient=TRUE)

#################################################
## Using fci_parallel with mutual information test
#################################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)

# The first parameter is the dataset
rfci_parallel(gmG$x, indepTest=mig, p=p, skel.method="parallel",
alpha=0.01, num.cores=2, mem.efficient=TRUE)



