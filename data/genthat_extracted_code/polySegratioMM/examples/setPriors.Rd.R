library(polySegratioMM)


### Name: setPriors
### Title: Set prior distributions for parameters of Bayesian mixture model
###   for dosages
### Aliases: setPriors
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## set up model with 3 components
x <- setModel(3,8)
x2 <- setPriors(x)
print(x2)

x2b <- setPriors(x, "strong")
print(x2b)




