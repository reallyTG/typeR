library(capn)


### Name: pdotaprox
### Title: Calculating Pdot-approximation coefficients
### Aliases: pdotaprox

### ** Examples

## 1-D Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
simuDataPdot <- cbind(nodes,sdot(nodes,param),
                      dsdotds(nodes,param),dsdotdss(nodes,param),
                      dwds(nodes,param),dwdss(nodes,param))
Aspace <- aproxdef(param$order,param$lowerK,param$upperK,param$delta)
pdotC <- pdotaprox(Aspace,simuDataPdot[,1],simuDataPdot[,2],
                   simuDataPdot[,3],simuDataPdot[,4],
                   simuDataPdot[,5],simuDataPdot[,6])



