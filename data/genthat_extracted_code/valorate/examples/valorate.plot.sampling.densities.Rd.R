library(valorate)


### Name: valorate.plot.sampling.densities
### Title: PLOT CO-OCCURRENCE DENSITIES FORMING A LOG-RANK DISTRIBUTION
### Aliases: valorate.plot.sampling.densities
###   valorate.plot.sampling.densities.figure

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000, verbose=TRUE)

## Not run: valorate.plot.sampling.densities(vo, 5)
## Not run: valorate.plot.sampling.densities(vo, 10)
## Not run: valorate.plot.sampling.densities(vo, 20, weighted=TRUE)

## Not run: valorate.plot.sampling.densities.figure(vo, 5)




