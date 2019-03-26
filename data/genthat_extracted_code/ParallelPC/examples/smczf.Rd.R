library(ParallelPC)


### Name: smczf
### Title: The sequential Monte Carlo permutation test for Gaussian
###   conditional independence test.
### Aliases: smczf

### ** Examples

##########################################
## Using smczf
##########################################
library(bnlearn)
library(pcalg)
data("gmG")
suffStat<-gmG$x
smczf(1,2,3,suffStat)



