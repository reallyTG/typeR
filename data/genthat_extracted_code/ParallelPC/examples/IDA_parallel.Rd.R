library(ParallelPC)


### Name: IDA_parallel
### Title: Estimate Total Causal Effects using the IDA_parallel Algorithm
### Aliases: IDA_parallel

### ** Examples

##########################################
## Using IDA_parallel without mem.efficeient
##########################################
library(bnlearn)
library(pcalg)
library(parallel)
data("gmI")
datacsv <- cov(gmI$x)
IDA_parallel(datacsv,1:2,3:4,"parallel",0.01, 2)

##########################################
## Using IDA_parallel with mem.efficeient
##########################################
library(bnlearn)
library(pcalg)
library(parallel)
data("gmI")
datacsv <- cov(gmI$x)
IDA_parallel(datacsv,1:2,3:4,"parallel",0.01, 2, TRUE)



