library(ParallelPC)


### Name: migsh
### Title: Shrinkage estimator for the mutual information (mi-g-sh)
### Aliases: migsh

### ** Examples

##########################################
## Using migsh
##########################################
library(bnlearn)
library(pcalg)
data("gmG")
suffStat<-gmG$x
migsh(1,2,3,suffStat)



