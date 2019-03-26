library(ParallelPC)


### Name: smcmig
### Title: The sequential Monte Carlo permutation test (smc-mi-g)
### Aliases: smcmig

### ** Examples

##########################################
## Using smcmig
##########################################
library(bnlearn)
library(pcalg)
data("gmG")
suffStat<-gmG$x
smcmig(1,2,3,suffStat)



