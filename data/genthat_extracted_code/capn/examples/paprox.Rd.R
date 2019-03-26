library(capn)


### Name: paprox
### Title: Calculating P-approximation coefficients
### Aliases: paprox

### ** Examples

## 1-D Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
simuDataP <- cbind(nodes,sdot(nodes,param),
                   dsdotds(nodes,param),dwds(nodes,param))
Aspace <- aproxdef(param$order,param$lowerK,param$upperK,param$delta)
pC <- paprox(Aspace,simuDataP[,1],simuDataP[,2],
             simuDataP[,3],simuDataP[,4])



