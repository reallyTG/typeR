library(polySegratio)


### Name: print.simAutoMarkers
### Title: Print objects of class simAutoMarkers
### Aliases: print.simAutoMarkers print.simAutoCross
###   print.divideAutoMarkers
### Keywords: manip

### ** Examples


## generate data sets
a1 <- sim.autoMarkers(4,c(0.8,0.2))
a2 <- sim.autoMarkers(8,c(0.7,0.2,0.09,0.01),type="homo",n.markers=20,n.individuals=10)

print(a1)
print(a2)

## datasets from crosses
p1 <- sim.autoCross(4, dose.proportion=c(0.7,0.3), n.markers=20, n.indiv=10)
print(p1)
p2 <- sim.autoCross(4, dose.proportion=list(p01=c(0.7,0.3),p10=c(0.7,0.3),p11=c(0.6,0.2,0.2)))
print(p2)

## divide up data from crosses
ss <- divide.autoMarkers(p2$markers)
print(ss)






