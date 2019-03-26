library(capn)


### Name: plotgen
### Title: Plot Generator for Shadow Price or Value Function
### Aliases: plotgen

### ** Examples

## 1-D Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
simuDataP <- cbind(nodes,sdot(nodes,param),
                   dsdotds(nodes,param),dwds(nodes,param))
Aspace <- aproxdef(param$order,param$lowerK,param$upperK,param$delta)

# p-approximation
pC <- paprox(Aspace,simuDataP[,1],simuDataP[,2],
             simuDataP[,3],simuDataP[,4])

# Without prividing W-value
GOMSimP <- psim(pC,simuDataP[,1])
# With W-value
GOMSimP2 <- psim(pC,simuDataP[,1],profit(nodes,param),simuDataP[,2])

# Shadow price-Stock plot
plotgen(GOMSimP)
plotgen(GOMSimP,ftype="p")
plotgen(GOMSimP,xlabel="Stock Size, S", ylabel="Shadow Price (USD/Kg)")

# Value-Stock-W plot
plotgen(GOMSimP2,ftype="vw")
plotgen(GOMSimP2,ftype="vw",xlabel="Stock Size, S", ylabel="Value Function")
plotgen(GOMSimP2,ftype="vw",xlabel="Stock Size, S", ylabel="Value Function")

## 2-D Prey-Predator example
data("lvdata")
aproxdeg <- c(20,20)
lower <- c(0.1,0.1)
upper <- c(1.5,1.5)
delta <- 0.03
lvspace <- aproxdef(aproxdeg,lower,upper,delta)
lvaproxc <- vaprox(lvspace,lvaproxdata)
lvsim <- vsim(lvaproxc,lvsimdata.time[,2:3])

# Shadow price-Stock plot
plotgen(lvsim)
plotgen(lvsim,ftype="p")
plotgen(lvsim,whichs=2,xlabel="Stock Size, S",ylabel="Shadow Price (USD/Kg)")

# Shadow price-time plot
plotgen(lvsim,whichs=2,tvar=lvsimdata.time[,1])

# Value Function-Stock plot
plotgen(lvsim,ftype="vw")
plotgen(lvsim,ftype="vw",whichs=2,
        xlabel="Stock Size, S",ylabel="Shadow Price (USD/Kg)")

# Value Function-time plot
plotgen(lvsim,ftype="vw",tvar=lvsimdata.time[,1])
plotgen(lvsim,ftype="vw",whichs=2,tvar=lvsimdata.time[,1],
        xlabel="Stock Size, S",ylabel="Shadow Price (USD/Kg)")



