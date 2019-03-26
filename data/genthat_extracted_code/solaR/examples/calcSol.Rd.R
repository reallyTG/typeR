library(solaR)


### Name: A1_calcSol
### Title: Apparent movement of the Sun from the Earth
### Aliases: calcSol
### Keywords: utilities constructors

### ** Examples

BTd=fBTd(mode='serie')

lat=37.2
sol=calcSol(lat, BTd[100])
print(as.zooD(sol))

library(lattice)
xyplot(as.zooI(sol))

solStrous=calcSol(lat, BTd[100], method='strous')
print(as.zooD(solStrous))

solSpencer=calcSol(lat, BTd[100], method='spencer')
print(as.zooD(solSpencer))

solCooper=calcSol(lat, BTd[100], method='cooper')
print(as.zooD(solCooper))



