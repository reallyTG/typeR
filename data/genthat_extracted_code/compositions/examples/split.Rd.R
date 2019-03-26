library(compositions)


### Name: split
### Title: Splitting datasets in groups given by factors
### Aliases: split.acomp split.aplus split.rcomp split.rplus split.rmult
###   split.ccomp
### Keywords: multivariate

### ** Examples

  data(SimulatedAmounts)
  split(acomp(sa.groups),sa.groups.area)
  lapply( split(acomp(sa.groups),sa.groups.area), mean)



