library(ParallelPC)


### Name: pcSelect_stable
### Title: Estimate subgraph around a response variable using pcSelect
### Aliases: pcSelect_stable

### ** Examples

##########################################
## Using pcSelect_stable
##########################################
library(pcalg)
library(parallel)
p <- 10
set.seed(101)
myDAG <- randomDAG(p, prob = 0.2)
n <- 1000
d.mat <- rmvDAG(n, myDAG, errDist = "normal")
pcSelect_stable(d.mat[,10],d.mat[,-10], alpha=0.05)



