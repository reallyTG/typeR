library(fanovaGraph)


### Name: estimateGraph
### Title: FANOVA graph estimation.
### Aliases: estimateGraph print.graphlist

### ** Examples

# Ishigami function, true analytical values: D12 = D23 = 0, D13 =~ 3.374
q.arg = list(list(min=-pi, max=pi), list(min=-pi, max=pi), list(min=-pi, max=pi)) 
estimateGraph(f.mat=ishigami.fun, d=3, q.arg=q.arg, n.tot=10000, method="LiuOwen")
estimateGraph(f.mat=ishigami.fun, d=3, q.arg=q.arg, n.tot=10000, method="FixFast")
estimateGraph(f.mat=ishigami.fun, d=3, q.arg=q.arg, n.tot=10000, method="RBD")
estimateGraph(f.mat=ishigami.fun, d=3, q.arg=q.arg, n.tot=10000, method="PickFreeze")



