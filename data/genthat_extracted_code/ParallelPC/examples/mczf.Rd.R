library(ParallelPC)


### Name: mczf
### Title: The Monte Carlo permutation test for Gaussian conditional
###   independence test
### Aliases: mczf

### ** Examples

##########################################
## Using mczf
##########################################
library(bnlearn)
library(pcalg)
data("gmG")
suffStat<-gmG$x
mczf(1,2,3,suffStat)



