library(capn)


### Name: vsim
### Title: Simulation of V-approximation
### Aliases: vsim

### ** Examples

## 1-D Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
simuDataV <- cbind(nodes,sdot(nodes,param),profit(nodes,param))
Aspace <- aproxdef(param$order,param$lowerK,param$upperK,param$delta)
vC <- vaprox(Aspace,simuDataV)
# Note vcol function requries a data.frame or matrix!
GOMSimV <- vsim(vC,as.matrix(simuDataV[,1],ncol=1),profit(nodes,param))

# plot shadow (accounting) price: Figure 4 in Fenichel and Abbott (2014)
plotgen(GOMSimV, xlabel="Stock size, s", ylabel="Shadow price")

## 2-D Prey-Predator example
data("lvdata")
aproxdeg <- c(20,20)
lower <- c(0.1,0.1)
upper <- c(1.5,1.5)
delta <- 0.03
lvspace <- aproxdef(aproxdeg,lower,upper,delta)
lvaproxc <- vaprox(lvspace,lvaproxdata)
lvsim <- vsim(lvaproxc,lvsimdata.time[,2:3])

# plot Biomass
plot(lvsimdata.time[,1], lvsimdata.time[,2], type='l', lwd=2, col="blue",
     xlab="Time",
     ylab="Biomass")
lines(lvsimdata.time[,1], lvsimdata.time[,3], lwd=2, col="red")
legend("topright", c("Prey", "Predator"), col=c("blue", "red"),
       lty=c(1,1), lwd=c(2,2), bty="n")

# plot shadow (accounting) prices
plot(lvsimdata.time[,1],lvsim[["shadowp"]][,1],type='l', lwd=2, col="blue",
     ylim = c(-5,7),
     xlab="Time",
     ylab="Shadow price")
lines(lvsimdata.time[,1],lvsim[["shadowp"]][,2], lwd=2, col="red")
legend("topright", c("Prey", "Predator"), col=c("blue", "red"),
       lty=c(1,1), lwd=c(2,2), bty="n")

# plot inclusive weath and value function
plot(lvsimdata.time[,1],lvsim[["iw"]],type='l', lwd=2, col="blue",
     ylim = c(-0.5,1.2),
     xlab="Time",
     ylab="Inclusive Wealth / Value Function ($)")
lines(lvsimdata.time[,1],lvsim[["vfun"]], lwd=2, col="red")
legend("topright", c("Inclusive Wealth", "Value Function"),
       col=c("blue", "red"), lty=c(1,1), lwd=c(2,2), bty="n")



