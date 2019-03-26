library(lctools)


### Name: mc.lcorrel
### Title: Monte Carlo simulation for the significance of the local
###   correlation coefficients
### Aliases: mc.lcorrel
### Keywords: Monte Carlo Simulation LPCCs inference GWPCCs inference local
###   multi-collinearity

### ** Examples

X<-rep(11:14, 4)
Y<-rev(rep(1:4, each=4))
var1<-c(1,1,1,1,1,1,2,2,2,2,3,3,3,4,4,5)
var2<-rev(var1)
Nsim= 19
bwSIM<-0.5

SIM20<-mc.lcorrel(Nsim,bwSIM, cbind(var1,var2),X,Y)

SIM20$pseudo.p.lpcc
SIM20$pseudo.p.gwpcc



