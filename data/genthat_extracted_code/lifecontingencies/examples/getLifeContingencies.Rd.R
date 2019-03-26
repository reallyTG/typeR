library(lifecontingencies)


### Name: getLifecontingencyPv
### Title: Functions to obtain the present value of a life contingency
###   given the time to death
### Aliases: getLifecontingencyPv getLifecontingencyPvXyz

### ** Examples

#simulate the PV values for some life contingencies given some death times
data(soa08Act)
testgetLifecontingencyPvXyzAxyz<-getLifecontingencyPvXyz(deathsTimeXyz=
matrix(c(50,50,51,43,44,22,12,56,20,24,53,12),
ncol=2),
lifecontingency = "Axyz",tablesList = list(soa08Act, soa08Act), i = 0.03, t=30,x=c(40,50),
m=0, k=1,status="last")
testgetLifecontingencyPvAxn<-getLifecontingencyPv(deathsTimeX = seq(0, 110, by=1), 
lifecontingency = "Axn", object=soa08Act, 
		x=40,t=20, m=0, k=1)



