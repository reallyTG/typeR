library(dsmodels)


### Name: simbasins
### Title: Find basins of attraction by simulation
### Aliases: simbasins

### ** Examples

library(dsmodels)

model <- dsmodel(function(X0,Y0) {
list(X0*exp(2.6-X0-6.45/(1+4.5*X0)),
     Y0*exp(2.6-Y0-0.15*X0-6.25/(1+4.5*Y0)))
})
model+dsrange(0:3,0:3,discretize = .08)+
      dspoint(1.9358, 1.5059, attractor=TRUE, col="green",  label = "K12")+
      dspoint(1.9358, 0,      attractor=TRUE, col="magenta",label = "K1")+
      dspoint(0,      1.9649, attractor=TRUE, col="orange", label = "K2")+
      dspoint(0,      0,      attractor=TRUE, col="blue",   display=FALSE)+
      dspoint(0.4419, 0.4416, col="yellow", label="A11")+
      simbasins(discretize=0.05)



