library(polySegratio)


### Name: divide.autoMarkers
### Title: Divide markers by parental type
### Aliases: divide.autoMarkers
### Keywords: manip

### ** Examples


p2 <- sim.autoCross(4,
dose.proportion=list(p01=c(0.7,0.3),p10=c(0.7,0.3),
                     p11=c(0.6,0.2,0.2)))
print(p2)

ss <- divide.autoMarkers(p2$markers)

print(ss)



