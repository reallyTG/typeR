library(valorate)


### Name: valorate.plot.subpop
### Title: PLOT ALL ESTIMATED LOG-RANK DISTRIBUTIONS
### Aliases: valorate.plot.subpop. valorate.plot.subpop.empirical
###   valorate.plot.subpop.empirical.to.0
###   valorate.plot.subpop.empirical.scaled

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000, verbose=TRUE)

for (i in c(5,10,20,30,40,50)) {
  groups <- numeric(100)
  groups[sample(100,i)] <- 1 
  valorate.survdiff(vo, groups) 
}

## Not run: valorate.plot.subpop.empirical(vo)
## Not run: valorate.plot.subpop.empirical.to.0(vo)




