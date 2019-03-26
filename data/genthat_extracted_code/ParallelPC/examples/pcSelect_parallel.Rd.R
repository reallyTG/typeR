library(ParallelPC)


### Name: pcSelect_parallel
### Title: Estimate subgraph around a response variable using
###   pcSelect_parallel.
### Aliases: pcSelect_parallel

### ** Examples

##########################################
## Using pcSelect_parallel without mem.efficeient
##########################################
library(pcalg)
library(parallel)
p <- 10
set.seed(101)
myDAG <- randomDAG(p, prob = 0.2)
n <- 1000
d.mat <- rmvDAG(n, myDAG, errDist = "normal")
pcSelect_parallel(d.mat[,10],d.mat[,-10], alpha=0.05,num_workers=2)

##########################################
## Using pcSelelct_parallel with mem.efficeient
##########################################
library(pcalg)
library(parallel)
p <- 10
set.seed(101)
myDAG <- randomDAG(p, prob = 0.2)
n <- 1000
d.mat <- rmvDAG(n, myDAG, errDist = "normal")
pcSelect_parallel(d.mat[,10],d.mat[,-10], alpha=0.05,mem.efficient=TRUE,num_workers=2)



