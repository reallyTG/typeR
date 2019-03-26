library(equivalence)


### Name: ptte.stat
### Title: Computes a paired t-test for equivalence from the mean and
###   standard deviation of a sample from a normally-distributed population
### Aliases: ptte.stat
### Keywords: htest

### ** Examples

data(ufc)
ptte.stat(mean(ufc$Height.m.p - ufc$Height.m, na.rm=TRUE),
  sd(ufc$Height.m.p - ufc$Height.m, na.rm=TRUE),
  sum(!is.na(ufc$Height.m.p - ufc$Height.m)))




