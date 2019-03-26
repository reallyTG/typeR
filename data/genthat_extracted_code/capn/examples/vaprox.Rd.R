library(capn)


### Name: vaprox
### Title: Calculating V-approximation coefficients
### Aliases: vaprox

### ** Examples

## 1-D Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
simuDataV <- cbind(nodes,sdot(nodes,param),profit(nodes,param))
Aspace <- aproxdef(param$order,param$lowerK,param$upperK,param$delta)
vC <- vaprox(Aspace,simuDataV)

## 2-D Prey-Predator example
data("lvdata")
aproxdeg <- c(20,20)
lower <- c(0.1,0.1)
upper <- c(1.5,1.5)
delta <- 0.03
lvspace <- aproxdef(aproxdeg,lower,upper,delta)
vaproxc <- vaprox(lvspace,lvaproxdata)



