library(psychotree)


### Name: mpttree
### Title: MPT Trees
### Aliases: mpttree coef.mpttree plot.mpttree print.mpttree
###   predict.mpttree
### Keywords: tree

### ** Examples

o <- options(digits = 4)

## Source Monitoring data
data("SourceMonitoring", package = "psychotools")

## MPT tree
sm_tree <- mpttree(y ~ sources + gender + age, data = SourceMonitoring,
  spec = mptspec("SourceMon", .restr = list(d1 = d, d2 = d)))
plot(sm_tree, index = c("D1", "D2", "d", "b", "g"))

## extract parameter estimates
coef(sm_tree)

## parameter instability tests in root node
library("strucchange")
sctest(sm_tree, node = 1)

## storage and retrieval deficits in psychiatric patients
data("MemoryDeficits", package = "psychotools")
MemoryDeficits$trial <- ordered(MemoryDeficits$trial)

## MPT tree
sr_tree <- mpttree(cbind(E1, E2, E3, E4) ~ trial + group,
  data = MemoryDeficits, cluster = ID, spec = mptspec("SR2"), alpha = 0.1)

## extract parameter estimates
coef(sr_tree)

options(digits = o$digits)



