library(shallot)


### Name: partition.distribution
### Title: Distribution
### Aliases: partition.distribution ewens print.shallot.distribution.ewens
###   ewens.pitman print.shallot.distribution.ewensPitman ewens.attraction
###   print.shallot.distribution.ewensAttraction ewens.pitman.attraction
###   print.shallot.distribution.ewensPitmanAttraction ddcrp
###   print.shallot.distribution.ddcrp

### ** Examples

pd1 <- ewens(mass(1),50)

decay <- decay.exponential(temperature(1.0),dist(scale(USArrests)))
attraction <- attraction(permutation(n.items=50,fixed=FALSE), decay)
pd2 <- ewens.pitman.attraction(mass(1), discount(0.05), attraction)

pd3 <- ddcrp(mass(1), attraction)



