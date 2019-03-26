library(ParallelPC)


### Name: IDA_stable
### Title: Estimate Total Causal Effects
### Aliases: IDA_stable

### ** Examples

##########################################
## Using IDA_stable
##########################################
library(pcalg)
data("gmI")
datacsv <- cov(gmI$x)
IDA_stable(datacsv,1:2,3:4,"stable",0.01)



