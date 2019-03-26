library(ParallelPC)


### Name: cor2
### Title: The Pearson's correlation test
### Aliases: cor2

### ** Examples

##########################################
## Using cor2 as a conditional independence test
##########################################
library(pcalg)
library(bnlearn)
data("gmG")
suffStat<-gmG$x
cor2(1,2,3,suffStat)
##Use cor2 with a causal discovery algorithm, e.g. PC
pc_stable(gmG$x, indepTest=cor2, p=ncol(gmG$x), alpha=0.01)



