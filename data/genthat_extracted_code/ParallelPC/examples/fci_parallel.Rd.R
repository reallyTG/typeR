library(ParallelPC)


### Name: fci_parallel
### Title: Estimate a Partial Ancestral Graph using the FCI_parallel
###   algorithm
### Aliases: fci_parallel

### ** Examples

##########################################
## Using fci_parallel without mem.efficeient
##########################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
fci_parallel(suffStat, indepTest=gaussCItest, p=p, skel.method="parallel", alpha=0.01, num.cores=2)

##########################################
## Using fci_parallel with mem.efficeient
##########################################

suffStat<-list(C=cor(gmG$x),n=nrow(gmG$x))
fci_parallel(suffStat, indepTest=gaussCItest, p=p, skel.method="parallel",
alpha=0.01, num.cores=2, mem.efficient=TRUE)

#################################################
## Using fci_parallel with mutual information test
#################################################
library(pcalg)
library(parallel)
data("gmG")
p<-ncol(gmG$x)
#' # The first parameter is the dataset
fci_parallel(gmG$x, indepTest=mig, p=p, skel.method="parallel",
alpha=0.01, num.cores=2, mem.efficient=TRUE)



