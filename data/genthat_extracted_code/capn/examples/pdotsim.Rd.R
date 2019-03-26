library(capn)


### Name: pdotsim
### Title: Simulation of Pdot-approximation
### Aliases: pdotsim

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
GOMSimPdot <- pdotsim(pdotC,simuDataPdot[,1],simuDataPdot[,2],simuDataPdot[,3],
                      profit(nodes,param),simuDataPdot[,5])
# Shadow Price
plotgen(GOMSimPdot, xlabel="Stock size, s", ylabel="Shadow price")

# Value function and profit
plotgen(GOMSimPdot,ftype="vw",
        xlabel="Stock size, s",
        ylabel=c("Value Function","Profit"))



