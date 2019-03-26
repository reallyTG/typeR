library(capn)


### Name: psim
### Title: Simulation of P-approximation
### Aliases: psim

### ** Examples

## 1-D Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
simuDataP <- cbind(nodes,sdot(nodes,param),
                   dsdotds(nodes,param),dwds(nodes,param))
Aspace <- aproxdef(param$order,param$lowerK,param$upperK,param$delta)
pC <- paprox(Aspace,simuDataP[,1],simuDataP[,2],
             simuDataP[,3],simuDataP[,4])
GOMSimP <- psim(pC,simuDataP[,1],profit(nodes,param),simuDataP[,2])

# Shadow Price
plotgen(GOMSimP, xlabel="Stock size, s", ylabel="Shadow price")

# Value function and profit
plotgen(GOMSimP,ftype="vw",
        xlabel="Stock size, s",
        ylabel=c("Value Function","Profit"))



