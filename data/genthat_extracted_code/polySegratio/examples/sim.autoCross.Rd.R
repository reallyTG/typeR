library(polySegratio)


### Name: sim.autoCross
### Title: Simulate dominant markers for an autopolyploid cross for all
###   parental types
### Aliases: sim.autoCross
### Keywords: manip

### ** Examples

p1 <- sim.autoCross(4, dose.proportion=c(0.7,0.3), n.markers=20, n.indiv=10)
print(p1)

p2 <- sim.autoCross(4, dose.proportion=list(p01=c(0.7,0.3),p10=c(0.7,0.3),p11=c(0.6,0.2,0.2)))
print(p2)



