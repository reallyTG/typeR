library(dsmodels)


### Name: simattractors
### Title: Determine the attractors of a model through simulation
### Aliases: simattractors

### ** Examples

model <- dsmodel(function(X0,Y0) {
list(X0*exp(2.6-X0-6.45/(1+4.5*X0)),
     Y0*exp(2.6-Y0-0.15*X0-6.25/(1+4.5*Y0)))
})

model + dsrange(5,5,0.09) + simattractors(discretize=0.02)



