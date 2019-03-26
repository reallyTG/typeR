library(ParallelPC)


### Name: smccor
### Title: The sequential Monte Carlo permutation test (smc-cor)
### Aliases: smccor

### ** Examples

##########################################
## Using smccor
##########################################
library(bnlearn)
library(pcalg)
data("gmG")
suffStat<-gmG$x
smccor(1,2,3,suffStat)



