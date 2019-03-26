library(ParallelPC)


### Name: jointIDA_parallel
### Title: Estimate Total Causal Effects of Joint Interventions
### Aliases: jointIDA_parallel

### ** Examples

##########################################
## Using IDA_parallel without mem.efficeient
##########################################
library(bnlearn)
library(pcalg)
library(parallel)
data("gmI")
datacsv <- cov(gmI$x)
jointIDA_parallel(datacsv,1:2,3, pcmethod="parallel",0.01, 2, technique="RRC")

##########################################
## Using IDA_parallel with mem.efficeient
##########################################
library(bnlearn)
library(pcalg)
library(parallel)
data("gmI")
datacsv <- cov(gmI$x)
jointIDA_parallel(datacsv,1:2,3, pcmethod="parallel",0.01, 2, TRUE, technique="RRC")



